class CreateStructureProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :structure_profiles do |t|
      t.string :uid
      t.references :structure_type, foreign_key: true
      t.string :name
      t.string :slogan
      t.string :address
      t.string :full_address
      t.string :street
      t.string :phone
      t.references :country, foreign_key: true
      t.string :locality
      t.string :email
      t.string :web
      t.float :latitude
      t.float :longitude
      t.text :description
      t.float :consultation_price, default: 0.0
      t.float :general_consultation_price, default: 0.0
      t.float :specialized_consultation_price, default: 0.0
      #t.bigint :views, default: 0
      t.string :status
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
