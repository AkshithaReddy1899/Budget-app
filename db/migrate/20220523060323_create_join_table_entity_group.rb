class CreateJoinTableEntityGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_entities, id: false do |t|
      t.belongs_to :groups
      t.belongs_to :entities
    end
  end
end
