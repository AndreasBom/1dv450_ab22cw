class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.references :user
      t.string :key, null: false
      t.timestamps null: false
    end
  end
end
