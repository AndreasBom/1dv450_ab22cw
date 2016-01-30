class AddApplicationToApis < ActiveRecord::Migration
  def change
    add_column :apis, :application, :string
  end
end
