class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.string :content
      t.string :type
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
