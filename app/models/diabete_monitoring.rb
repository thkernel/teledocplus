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
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class DiabeteMonitoring < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :patient, :foreign_key => "patient_id", :class_name => "User"

  belongs_to :user
end
