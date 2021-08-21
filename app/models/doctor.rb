# == Schema Information
#
# Table name: doctors
#
#  id                             :bigint           not null, primary key
#  uid                            :string
#  first_name                     :string
#  last_name                      :string
#  civility                       :string
#  speciality_id                  :bigint
#  address                        :string
#  phone                          :string
#  country_id                     :bigint
#  locality                       :string
#  email                          :string
#  description                    :text
#  consultation_price             :float            default(0.0)
#  general_consultation_price     :float            default(0.0)
#  specialized_consultation_price :float            default(0.0)
#  status                         :string
#  user_id                        :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#


class Doctor < ApplicationRecord
  
end
