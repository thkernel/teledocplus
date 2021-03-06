# == Schema Information
#
# Table name: heart_failure_monitorings
#
#  id                :bigint           not null, primary key
#  uid               :string
#  patient_id        :bigint
#  weight            :float
#  cardiac_frequency :float
#  breathlessness    :boolean
#  feet_swelling     :boolean
#  status            :string
#  comments          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class HeartFailureMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :uid, :weight, :cardiac_frequency, :breathlessness, :feet_swelling, :status, :comments
  has_one :patient
  has_one :user
end
