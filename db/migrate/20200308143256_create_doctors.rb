class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.references :speciality, foreign_key: true
      t.string :address
      t.string :phone
      t.references :country, foreign_key: true
      t.string :locality
      t.string :email
      t.text :description
      t.float :consultation_price, default: 0.0
      t.float :general_consultation_price, default: 0.0
      t.float :specialized_consultation_price, default: 0.0
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
