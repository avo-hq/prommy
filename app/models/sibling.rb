# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  person_id  :bigint
#
class Sibling < Person
  has_many :spouses, foreign_key: :person_id

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "person_id", "type", "updated_at", "user_id"]
  end
end
