# == Schema Information
#
# Table name: grouptwo_relationships
#
#  id          :integer          not null, primary key
#  grouptwo_id :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GrouptwoRelationship < ApplicationRecord
  # belongs_to :grouptwo
  # belongs_to :user
end
