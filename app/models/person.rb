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
class Person < ApplicationRecord
  belongs_to :user, optional: true
  has_many :spouses, foreign_key: :person_id
  has_many :relatives, foreign_key: :person_id, class_name: "Person"
  has_many :peoples, foreign_key: :person_id, class_name: "Person"

  def link
    "<a href='https://avohq.io'>#{name}</a>"
  end

  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end
end
