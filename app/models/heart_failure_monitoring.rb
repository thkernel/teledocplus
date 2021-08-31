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

class HeartFailureMonitoring < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  
  belongs_to :patient, :foreign_key => "patient_id", :class_name => "User"
  belongs_to :user
end
