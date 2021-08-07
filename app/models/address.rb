# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  uid              :string
#  addressable_type :string
#  addressable_id   :bigint
#  address_1        :string
#  address_2        :string
#  phone_1          :string
#  phone_2          :string
#  neighborhood     :string
#  state            :string
#  country          :string
#  city             :string
#  zip_code         :string
#  po_box           :string
#  street           :string
#  door             :string
#  latitude         :float
#  longitude        :float
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Address < ApplicationRecord
    include PgSearch::Model
    belongs_to :addressable, polymorphic: true, optional: true


    pg_search_scope :search_address_city, against: [:city],  using: {
    tsearch: {
      prefix: true
    }
  }
end
