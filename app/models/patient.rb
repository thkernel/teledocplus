# == Schema Information
#
# Table name: patients
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  first_name           :string
#  last_name            :string
#  civility             :string
#  age                  :string
#  address              :string
#  phone                :string
#  country_id           :bigint
#  locality             :string
#  email                :string
#  pathology            :string
#  monitoring_frequency :string
#  description          :text
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#



class Patient < ApplicationRecord
 
end
