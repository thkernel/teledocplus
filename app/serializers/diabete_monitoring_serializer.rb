class DiabeteMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :uid, :glycemie_a_jeun, :sueurs, :sensation_de_faim, :tremblement, :vertige, :irritabilite, :polyurie_majoree, :fatigue_majoree, :amaigrissement, :comments, :status
  has_one :patient
  has_one :user
end
