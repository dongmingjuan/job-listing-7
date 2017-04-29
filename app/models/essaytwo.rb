# == Schema Information
#
# Table name: essaytwos
#
#  id          :integer          not null, primary key
#  content     :text
#  grouptwo_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Essaytwo < ApplicationRecord
  belongs_to :user
  belongs_to :grouptwo
  validates :content, presence: true
end
