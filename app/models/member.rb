# app/models/member.rb
class Member < ApplicationRecord
  belongs_to :household
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :member_chores, dependent: :destroy
end
