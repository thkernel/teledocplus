# == Schema Information
#
# Table name: organizations
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  name                 :string
#  organization_type_id :bigint
#  activity_field_id    :bigint
#  slogan               :string
#  address              :string
#  city                 :string
#  state                :string
#  country              :string
#  phone                :string
#  email                :string
#  fax                  :string
#  zip_code             :string
#  web_site             :string
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class OrganizationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers


  attributes :id, :uid, :name, :organization_type_id, :activity_field_id, :slogan, :address,
  :city, :state, :country, :phone, :email, :fax, :zip_code, :web_site, :status, :logo_url

  belongs_to :user
  belongs_to :organization_type
  has_many :portfolios

  def logo_url
    rails_blob_url(object.logo) if object.logo.attachment
  end
end
