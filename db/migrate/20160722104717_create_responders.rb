class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :name
      t.string :responder_type

      t.timestamps null: false
    end
  end
end
