class Groupone < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essayones
end
