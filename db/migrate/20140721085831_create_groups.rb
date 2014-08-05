class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_type
      t.text :about
      t.text :details
      t.text :scope
      t.text :location

      t.timestamps
    end
  end
end
