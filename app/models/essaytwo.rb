class Essaytwo < ApplicationRecord
  belongs_to :user
  belongs_to :grouptwo
  validates :content, presence: true
end
