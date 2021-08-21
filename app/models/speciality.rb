# == Schema Information
#
# Table name: specialities
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Speciality < ApplicationRecord
  belongs_to :user

  # Validations
  validates :name, presence: true, uniqueness: true
end
