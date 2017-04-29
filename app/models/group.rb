# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Group < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essays

  # has_many :group_relationships
  # has_many :members, through: :group_relationships, source: :user
end
