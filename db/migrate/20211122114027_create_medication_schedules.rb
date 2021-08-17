class CreateMedicationSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :medication_schedules do |t|
      t.string :uid
      t.references :doctor, index: true
      t.references :patient, index: true
      t.string :morning_number
      t.string :noo_number
      t.string :evening_number
      t.string :status
      t.text :comments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
