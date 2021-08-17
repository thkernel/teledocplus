class HeartFailureMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :uid, :weight, :cardiac_frequency, :breathlessness, :feet_swelling, :status, :comments
  has_one :patient
  has_one :user
end
