# == Schema Information
#
# Table name: essayones
#
#  id          :integer          not null, primary key
#  content     :text
#  groupone_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Essayone < ApplicationRecord
  belongs_to :user
  belongs_to :groupone
  validates :content, presence: true
end
