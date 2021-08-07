# == Schema Information
#
# Table name: portfolios
#
#  id              :bigint           not null, primary key
#  uid             :string
#  name            :string
#  description     :text
#  status          :string
#  organization_id :bigint
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PortfolioSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers
 	attributes :id, :uid, :name,  :description, :status, :organization_id, :thumbnail_url
 	has_one :user
 	has_many :cards
 	belongs_to :organization


 	def thumbnail_url
    	rails_blob_url(object.thumbnail) if object.thumbnail.attachment
  	end
end
