class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.belongs_to :user
      t.belongs_to :affiliate, :class_name => 'User'
      t.string :relation

      t.timestamps
    end
  end
end
