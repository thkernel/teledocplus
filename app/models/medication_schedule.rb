# == Schema Information
#
# Table name: medication_schedules
#
#  id             :bigint           not null, primary key
#  uid            :string
#  doctor_id      :bigint
#  patient_id     :bigint
#  morning_number :string
#  noon_number    :string
#  evening_number :string
#  status         :string
#  comments       :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MedicationSchedule < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  
  belongs_to :doctor
  belongs_to :patient
  belongs_to :user
end
