# == Schema Information
#
# Table name: doctor_profiles
#
#  id                             :bigint           not null, primary key
#  uid                            :string
#  first_name                     :string
#  last_name                      :string
#  civility                       :string
#  speciality_id                  :bigint
#  address                        :string
#  phone                          :string
#  country_id                     :bigint
#  locality                       :string
#  email                          :string
#  description                    :text
#  consultation_price             :float            default(0.0)
#  general_consultation_price     :float            default(0.0)
#  specialized_consultation_price :float            default(0.0)
#  status                         :string
#  user_id                        :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#


class DoctorProfile < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  #self.table_name = "doctor"
  has_one :user, as: :userable

  belongs_to :speciality
  belongs_to :country
  

  validates :email, presence: true, uniqueness: true
  def full_name
    
    "#{first_name} #{last_name}"
  end

  
end
