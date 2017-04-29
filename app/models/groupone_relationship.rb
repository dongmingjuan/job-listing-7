# == Schema Information
#
# Table name: groupone_relationships
#
#  id          :integer          not null, primary key
#  groupone_id :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GrouponeRelationship < ApplicationRecord
  # belongs_to :groupone
  # belongs_to :user
end
