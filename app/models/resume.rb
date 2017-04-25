class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :comments
  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
end
