class CreateHeartFailureMonitorings < ActiveRecord::Migration[6.1]
  def change
    create_table :heart_failure_monitorings do |t|
      t.string :uid
      t.references :patient, index: true
      t.float :weight
      t.float :cardiac_frequency
      t.boolean :breathlessness
      t.boolean :feet_swelling
      t.string :status
      t.text :comments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
