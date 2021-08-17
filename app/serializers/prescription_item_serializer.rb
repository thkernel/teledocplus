class PrescriptionItemSerializer < ActiveModel::Serializer
  attributes :id, :uid, :medicament, :posologie, :comment, :status
  has_one :prescription
  has_one :user
end
