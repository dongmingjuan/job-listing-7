class CreateEssaytwos < ActiveRecord::Migration[5.0]
  def change
    create_table :essaytwos do |t|
      t.text :content
      t.integer :grouptwo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
