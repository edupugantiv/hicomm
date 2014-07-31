class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.string :content
      t.string :message_type
      t.boolean :read
      t.string :source
      t.belongs_to :post
      t.references :user, index: true
      t.belongs_to :postable, :polymorphic => true

      t.timestamps
    end
  end
end
