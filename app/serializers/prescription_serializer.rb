# == Schema Information
#
# Table name: prescriptions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  doctor_id  :bigint
#  patient_id :bigint
#  status     :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :uid, :status
  has_one :doctor
  has_one :patient
  has_one :user
end
