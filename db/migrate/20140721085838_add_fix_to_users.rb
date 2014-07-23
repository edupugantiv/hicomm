class AddFixToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :preference, :string
  end
end
