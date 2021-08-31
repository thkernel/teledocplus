# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  role_id                :bigint
#  userable_type          :string
#  userable_id            :bigint
#  status                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  

  

 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#,:confirmable, :lockable, :timeoutable, :trackable
         #:omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  # Relationships
  belongs_to :userable, polymorphic: true, optional: true

  #has_one :profile, dependent: :destroy
  belongs_to :role
  
  has_many :structure_types, dependent: :destroy
  has_many :structure_profiles, dependent: :destroy
  has_many :doctor_profiles, dependent: :destroy
  has_many :patient_profiles, dependent: :destroy
  has_many :specialities, dependent: :destroy
  has_many :countries, dependent: :destroy
  has_many :medication_schedules, dependent: :destroy

  has_many :patient_appointments, :class_name => "Appointment", :foreign_key => :patient_id
  has_many :patient_prescriptions, :class_name => "Prescription", :foreign_key => :patient_id
  has_many :doctor_appointments, :class_name => "Appointment", :foreign_key => :doctor_id
  has_many :doctor_prescriptions, :class_name => "Prescription", :foreign_key => :doctor_id

  has_many :patient_hta_monitorings, :class_name => "HtaMonitoring", :foreign_key => :patient_id
  has_many :patient_diabete_monitorings, :class_name => "DiabeteMonitoring", :foreign_key => :patient_id
  has_many :patient_heart_failure_monitorings, :class_name => "HeartFailureMonitoring", :foreign_key => :patient_id




  #has_many :organizations, dependent: :destroy
  #has_many :subscriptions, dependent: :destroy
  #has_many :services, dependent: :destroy
  #has_many :portfolios, dependent: :destroy
  #has_many :invitations, dependent: :destroy
  #has_many :cards, dependent: :destroy
	#has_many :recipient_invitations, :class_name => "Invitation", :foreign_key => :recipient_id
	#has_many :recipient_notifications, :class_name => "Notification", :foreign_key => :recipient_id


  # Add nested attributes for profile.
  #accepts_nested_attributes_for :profile

  # Validations
  #validates :login, presence: true, uniqueness: true
  #validates :identifier, presence: true, uniqueness: true

  def self.find_user_by_slug(slug)
    where("slug = ? ", "#{slug}")
  end

  def superuser?
    if self.role.name == "superuser"
      true 
    else
      false
    end
  end

  def user?
    if self.role.name == "user"
      true 
    else
      false
    end
  end

  def admin?
    if self.role.name == "administrateur"
      true 
    else
      false
    end
  end


  # Get userable full name
  def full_name
    self.userable.full_name
  end

  
  private 
	
	def random_uid 
		begin
			self.uid = SecureRandom.hex(32)
		end while User.where(uid: self.uid).exists?
  end 

  def set_default_role

    unless self.role_id.present?
      role = Role.find_by(name: "user")
      self.role_id = role.id
    end
  end
  


  

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end



  pg_search_scope :search_by_login_or_email, against: [:login, :email],  using: {
    tsearch: {
      prefix: true
    }
  }

  scope :patients, ->{where(role_id: Role.find_by(name: "Patient").id)}
 
end
