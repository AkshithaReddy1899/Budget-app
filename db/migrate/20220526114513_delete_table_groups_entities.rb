class DeleteTableGroupsEntities < ActiveRecord::Migration[7.0]
  def change
    drop_table :groups_entities do |t|
      t.integer :groups_id
      t.integer :entities_id
    end
  end
end
