# == Schema Information
#
# Table name: hta_monitorings
#
#  id         :bigint           not null, primary key
#  uid        :string
#  patient_id :bigint
#  tas        :string
#  tad        :string
#  status     :string
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class HtaMonitoringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
