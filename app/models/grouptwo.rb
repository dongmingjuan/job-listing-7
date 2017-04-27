class Grouptwo < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essaytwos

   has_many :grouptwo_relationships
   has_many :members, through: :grouptwo_relationships, source: :user
end
