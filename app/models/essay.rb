# == Schema Information
#
# Table name: essays
#
#  id         :integer          not null, primary key
#  content    :text
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Essay < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :content, presence: true
end
