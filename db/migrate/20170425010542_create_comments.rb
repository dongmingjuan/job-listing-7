class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :job_id
      t.integer :resume_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
