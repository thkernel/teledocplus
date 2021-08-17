class CreateDiabeteMonitorings < ActiveRecord::Migration[6.1]
  def change
    create_table :diabete_monitorings do |t|
      t.string :uid
      t.references :patient, index: true
      t.string :glycemie_a_jeun
      t.boolean :sueurs
      t.boolean :sensation_de_faim
      t.boolean :tremblement
      t.boolean :vertige
      t.boolean :irritabilite
      t.boolean :polyurie_majoree
      t.boolean :fatigue_majoree
      t.boolean :amaigrissement
      t.text :comments
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
