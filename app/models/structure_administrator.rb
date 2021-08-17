# == Schema Information
#
# Table name: structure_administrators
#
#  id            :bigint           not null, primary key
#  structure_id  :bigint
#  profile_id    :bigint
#  administrator :boolean
#  user_id       :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class StructureAdministrator < ApplicationRecord
  belongs_to :structure
  belongs_to :profile
  belongs_to :user
end
