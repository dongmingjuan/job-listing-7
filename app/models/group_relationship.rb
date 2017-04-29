# == Schema Information
#
# Table name: group_relationships
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupRelationship < ApplicationRecord
  # belongs_to :group
  # belongs_to :user
end
