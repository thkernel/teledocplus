# == Schema Information
#
# Table name: patient_profiles
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  first_name           :string
#  last_name            :string
#  civility             :string
#  age                  :string
#  address              :string
#  phone                :string
#  country_id           :bigint
#  locality             :string
#  email                :string
#  pathology            :string
#  monitoring_frequency :string
#  description          :text
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#



class PatientProfile < ApplicationRecord

	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  

 # Rename class name
 #self.table_name = "patient"

 has_one :user, as: :userable
 belongs_to :country
 
validates :email, presence: true, uniqueness: true


 def full_name
    
    "#{first_name} #{last_name}"
  end

end
