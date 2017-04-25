class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :resume
  belongs_to :job
end
