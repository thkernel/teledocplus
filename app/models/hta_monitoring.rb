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
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HtaMonitoring < ApplicationRecord
  belongs_to :patient
  belongs_to :user
end
