class CreateLocalities < ActiveRecord::Migration[6.1]
  def change
    create_table :localities do |t|
      t.string :uid
      t.references :country, foreign_key: true
      t.string :region
      t.string :cercle
      t.string :commune
      t.string :city
      t.string :neighbourhood
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
