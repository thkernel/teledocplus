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

class PrescriptionItem < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :prescription
 # belongs_to :user
end
