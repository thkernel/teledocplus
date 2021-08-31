# == Schema Information
#
# Table name: structure_profiles
#
#  id                             :bigint           not null, primary key
#  uid                            :string
#  structure_type_id              :bigint
#  name                           :string
#  slogan                         :string
#  address                        :string
#  full_address                   :string
#  street                         :string
#  phone                          :string
#  country_id                     :bigint
#  locality                       :string
#  email                          :string
#  web                            :string
#  latitude                       :float
#  longitude                      :float
#  description                    :text
#  consultation_price             :float            default(0.0)
#  general_consultation_price     :float            default(0.0)
#  specialized_consultation_price :float            default(0.0)
#  status                         :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

class StructureProfile < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  
  belongs_to :structure_type
  has_one :user, as: :userable
  
end
