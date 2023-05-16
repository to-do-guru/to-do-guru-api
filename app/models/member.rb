# app/models/member.rb
class Member < ApplicationRecord
  belongs_to :household

  has_many :member_chores, dependent: :destroy
end
