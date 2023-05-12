class Member < ApplicationRecord
  belongs_to :household

  has_many :member_chores
end
