class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :reason
      t.integer :fire_need
      t.integer :police_need
      t.integer :medical_need
      t.string :city

      t.timestamps null: false
    end
    add_column :responders, :city, :string
  end
end
