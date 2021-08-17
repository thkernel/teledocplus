class HtaMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :tas, :tad, :status, :comments
  has_one :patient
  has_one :user
end
