# == Schema Information
#
# Table name: organizations
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  name                 :string
#  organization_type_id :bigint
#  activity_field_id    :bigint
#  slogan               :string
#  address              :string
#  city                 :string
#  state                :string
#  country              :string
#  phone                :string
#  email                :string
#  fax                  :string
#  zip_code             :string
#  web_site             :string
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Organization < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  

  belongs_to :user
  belongs_to :organization_type
  has_many :services, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :portfolios, dependent: :destroy



  has_one_attached :logo



end
