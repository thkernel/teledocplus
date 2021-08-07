# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  uid        :string
#  slug       :string
#  title      :string
#  content    :text
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :generate_random_number_uid

  belongs_to :user
  

  validates :title, presence: true, uniqueness: true
end
