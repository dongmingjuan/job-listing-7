# == Schema Information
#
# Table name: groupones
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Groupone < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essayones

  #  has_many :groupone_relationships
  #  has_many :members, through: :groupone_relationships, source: :user
end
