class Grouptwo < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essaytwos
end
