class CreateGrouponeRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :groupone_relationships do |t|
      t.string :groupone_id
      t.integer :user_id

      t.timestamps
    end
  end
end
