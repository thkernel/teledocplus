class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :uid
      t.string :name
      t.references :organization_type, foreign_key: true
      t.references :activity_field, foreign_key: true
      t.string :slogan
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :email
      t.string :fax
      t.string :zip_code
      t.string :web_site
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
