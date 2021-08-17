class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :uid, :status
  has_one :doctor
  has_one :patient
  has_one :user
end
