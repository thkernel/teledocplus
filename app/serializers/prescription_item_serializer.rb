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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PrescriptionItemSerializer < ActiveModel::Serializer
  attributes :id, :uid, :medicament, :posologie, :comment, :status
  has_one :prescription
  has_one :user
end
