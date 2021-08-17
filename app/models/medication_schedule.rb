class MedicationSchedule < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :user
end
