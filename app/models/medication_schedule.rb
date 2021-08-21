# == Schema Information
#
# Table name: medication_schedules
#
#  id             :bigint           not null, primary key
#  uid            :string
#  doctor_id      :bigint
#  patient_id     :bigint
#  morning_number :string
#  noo_number     :string
#  evening_number :string
#  status         :string
#  comments       :text
#  user_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MedicationSchedule < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :user
end
