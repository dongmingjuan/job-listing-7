# == Schema Information
#
# Table name: grouptwos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Grouptwo < ApplicationRecord
  validates :title, presence: true
   belongs_to :user
   has_many :essaytwos

  #  has_many :grouptwo_relationships
  #  has_many :members, through: :grouptwo_relationships, source: :user
end
