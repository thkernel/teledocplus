class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :uid
      t.references :addressable, polymorphic: true, index: true
      t.string :address_1
      t.string :address_2
      t.string :phone_1
      t.string :phone_2
      t.string :neighborhood
      t.string :state
      t.string :country
      t.string :city
      t.string :zip_code
      t.string :po_box
      t.string :street
      t.string :door
      t.float  :latitude
      t.float  :longitude
      t.string :status

      t.timestamps
    end
  end
end
