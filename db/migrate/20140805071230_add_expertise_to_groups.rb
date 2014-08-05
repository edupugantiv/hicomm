class AddExpertiseToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :expertise, :text
  end
end
