# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  uid             :string
#  organization_id :bigint
#  name            :string
#  description     :string
#  status          :string
#  parent_id       :bigint
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Service < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :organization
  belongs_to :user

  has_many :invitations, dependent: :destroy
  has_many :members, dependent: :destroy


  
end
