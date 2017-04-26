class AddUserIdToGroupone < ActiveRecord::Migration[5.0]
  def change
    add_column :groupones, :user_id, :integer
  end
end
