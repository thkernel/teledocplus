# == Schema Information
#
# Table name: hta_monitorings
#
#  id         :bigint           not null, primary key
#  uid        :string
#  patient_id :bigint
#  tas        :string
#  tad        :string
#  status     :string
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HtaMonitoringSerializer < ActiveModel::Serializer
  attributes :id, :tas, :tad, :status, :comments
  has_one :patient
  has_one :user
end
