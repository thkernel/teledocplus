# == Schema Information
#
# Table name: structures
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
#  views                          :bigint           default(0)
#  status                         :string
#  user_id                        :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

class Structure < ApplicationRecord
  include PgSearch::Model

  belongs_to :country

  belongs_to :structure_type
  belongs_to :user
  #has_many :analyses, dependent: :destroy
  #has_many :structure_analyses, dependent: :destroy

  #has_many :medicaments, dependent: :destroy
  #has_many :structure_medicaments, dependent: :destroy

  #has_many :medicament_orders, dependent: :destroy
  #has_many :analysis_requests, dependent: :destroy

  #has_many :appointments, dependent: :destroy

  #has_many :structure_profiles, dependent: :destroy
  #has_many :profiles, :through => :structure_profiles, dependent: :destroy

  #has_one :structure_administrator, dependent: :destroy
  #has_one :profile, :through => :structure_administrator, dependent: :destroy


  has_one_attached :logo

  #has_many :work_place_items
  #has_one :schedule, dependent: :destroy
  #has_many :file_sents, dependent: :destroy
  
  # Validations
  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_name, against: [:name],  using: {
    tsearch: {
      prefix: true
    }
  }
  scope :find_by_structure_type, -> (structure_type_id){where("structure_type_id = ?", structure_type_id)}
end
