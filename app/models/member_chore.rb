# app/models/member_chore.rb
class MemberChore < ApplicationRecord
  belongs_to :member
  belongs_to :chore
end
