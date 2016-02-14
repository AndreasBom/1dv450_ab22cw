class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :message
      t.integer :rating

      t.timestamps null: false
    end
  end
end
