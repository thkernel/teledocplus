class MedicationScheduleSerializer < ActiveModel::Serializer
  attributes :id, :uid, :morning_number, :noo_number, :evening_number, :status, :comments
  has_one :doctor
  has_one :patient
  has_one :user
end
