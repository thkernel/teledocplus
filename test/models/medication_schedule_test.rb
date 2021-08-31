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

require "test_helper"

class MedicationScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
