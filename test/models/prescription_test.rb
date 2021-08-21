# == Schema Information
#
# Table name: prescriptions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  doctor_id  :bigint
#  patient_id :bigint
#  status     :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class PrescriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
