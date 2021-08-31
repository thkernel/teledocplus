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

class HtaMonitoring < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  
  belongs_to :patient, :foreign_key => "patient_id", :class_name => "User"
  belongs_to :user
end
