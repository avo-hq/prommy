# == Schema Information
#
# Table name: team_memberships
#
#  id         :bigint           not null, primary key
#  team_id    :bigint           not null
#  user_id    :bigint           not null
#  level      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TeamMembership < ApplicationRecord
  belongs_to :team
  belongs_to :user

  def name
    "#{team&.name} - #{user&.name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "level", "team_id", "updated_at", "user_id"]
  end
end
