# == Schema Information
#
# Table name: prescription_items
#
#  id              :bigint           not null, primary key
#  uid             :string
#  prescription_id :bigint           not null
#  medicament      :string
#  posologie       :string
#  comments        :text
#  status          :string
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require "test_helper"

class PrescriptionItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
