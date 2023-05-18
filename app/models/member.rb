# app/models/member.rb
class Member < ApplicationRecord
  belongs_to :household
  validates_uniqueness_of :name

  has_many :member_chores, dependent: :destroy
end
