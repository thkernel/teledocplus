class CreatePatientProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_profiles do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.string :age
      t.string :address
      t.string :phone
      t.references :country, foreign_key: true
      t.string :locality
      t.string :email
      t.string :pathology
      t.string :monitoring_frequency
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
