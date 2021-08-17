class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, index: true
      t.references :doctor, index: true
      t.string :reason
      t.string :day
      t.time :start_time
      t.time :end_time
      t.text :content
      t.boolean :validated
      t.datetime :validation_date
      t.boolean :canceled
      t.datetime :canceled_date
      t.string :status
      

      t.timestamps
    end
  end
end
