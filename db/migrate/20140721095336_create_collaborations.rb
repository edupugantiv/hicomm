class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :group
      t.belongs_to :collaborator, :class_name => "Group"
      t.string     :relation
      t.timestamps
    end
  end
end
