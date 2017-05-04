class AddImageToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :image, :string
  end
end
