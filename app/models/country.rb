# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  uid        :string
#  name       :string
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  belongs_to :user
  #has_many :localities
end
