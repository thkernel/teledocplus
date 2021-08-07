class CreateContactForms < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_forms do |t|
      t.string :uid
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :object
      t.text :message
      t.boolean :read
      t.datetime :read_at
      t.string :status
      t.timestamps
    end
  end
end
