class CreateHtaMonitorings < ActiveRecord::Migration[6.1]
  def change
    create_table :hta_monitorings do |t|
      t.string :uid
      t.references :patient, index: true
      t.string :tas
      t.string :tad
      t.string :status
      t.text :comments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
