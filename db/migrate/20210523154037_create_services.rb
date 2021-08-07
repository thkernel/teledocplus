class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :uid
      t.references :organization, foreign_key: true
      t.string :name
      t.string :description
      t.string :status
      t.references :parent, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
