class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
