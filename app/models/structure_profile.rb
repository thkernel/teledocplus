# == Schema Information
#
# Table name: structure_profiles
#
#  id           :bigint           not null, primary key
#  structure_id :bigint
#  profile_id   :bigint
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class StructureProfile < ApplicationRecord
  belongs_to :structure
  belongs_to :profile
end
