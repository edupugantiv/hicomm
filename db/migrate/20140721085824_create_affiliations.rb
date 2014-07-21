class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.string :role

      t.timestamps
    end
  end
end
