class Essayone < ApplicationRecord
  belongs_to :user
  belongs_to :groupone
  validates :content, presence: true
end
