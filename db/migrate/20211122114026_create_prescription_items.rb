class CreatePrescriptionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :prescription_items do |t|
      t.string :uid
      t.references :prescription, null: false, foreign_key: true
      t.string :medicament
      t.string :posologie
      t.text :comments
      t.string :status
      #t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
