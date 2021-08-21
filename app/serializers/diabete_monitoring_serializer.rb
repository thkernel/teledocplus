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

class DiabeteMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :uid, :glycemie_a_jeun, :sueurs, :sensation_de_faim, :tremblement, :vertige, :irritabilite, :polyurie_majoree, :fatigue_majoree, :amaigrissement, :comments, :status
  has_one :patient
  has_one :user
end
