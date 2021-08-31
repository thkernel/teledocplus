# == Schema Information
#
# Table name: prescriptions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  doctor_id  :bigint
#  patient_id :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prescription < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :patient, :foreign_key => "patient_id", :class_name => "User"
  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"
  #belongs_to :user


  has_many :prescription_items, dependent: :destroy
  accepts_nested_attributes_for :prescription_items ,  allow_destroy: true
end
