class Groupone < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essayones

   has_many :groupone_relationships
   has_many :members, through: :groupone_relationships, source: :user
end
