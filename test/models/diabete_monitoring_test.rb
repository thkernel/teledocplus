# == Schema Information
#
# Table name: diabete_monitorings
#
#  id                :bigint           not null, primary key
#  uid               :string
#  patient_id        :bigint
#  glycemie_a_jeun   :string
#  sueurs            :boolean
#  sensation_de_faim :boolean
#  tremblement       :boolean
#  vertige           :boolean
#  irritabilite      :boolean
#  polyurie_majoree  :boolean
#  fatigue_majoree   :boolean
#  amaigrissement    :boolean
#  comments          :text
#  status            :string
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require "test_helper"

class DiabeteMonitoringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
