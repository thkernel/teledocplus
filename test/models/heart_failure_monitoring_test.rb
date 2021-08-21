# == Schema Information
#
# Table name: heart_failure_monitorings
#
#  id                :bigint           not null, primary key
#  uid               :string
#  patient_id        :bigint
#  weight            :float
#  cardiac_frequency :float
#  breathlessness    :boolean
#  feet_swelling     :boolean
#  status            :string
#  comments          :text
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require "test_helper"

class HeartFailureMonitoringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
