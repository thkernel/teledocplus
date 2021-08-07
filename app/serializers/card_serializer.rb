# == Schema Information
#
# Table name: cards
#
#  id            :bigint           not null, primary key
#  portfolio_id  :bigint
#  uid           :string
#  first_name    :string
#  last_name     :string
#  organization  :string
#  work_position :string
#  work_phone    :string
#  private_phone :string
#  mobile_phone  :string
#  work_fax      :string
#  private_fax   :string
#  email         :string
#  address       :string
#  website       :string
#  street        :string
#  zipcode       :string
#  city          :string
#  country       :string
#  descrption    :text
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CardSerializer < ActiveModel::Serializer
  attributes :id, :portfolio_id, :uid, :first_name, :last_name, :organization, :work_position,
  :work_phone, :private_phone, :mobile_phone, :work_fax, :private_fax, :email, :website, :street,
  :zipcode, :city, :country, :descrption, :status, :thumbnail_url
  
  belongs_to :portfolio

  def thumbnail_url
    	rails_blob_url(object.thumbnail) if object.thumbnail.attachment
  	end
end
