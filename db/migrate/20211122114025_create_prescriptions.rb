class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :uid
      t.references :doctor,  index: true
      t.references :patient,  index: true
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
