class Chore < ApplicationRecord
  belongs_to :household
  
  has_many :member_chores
  
  enum day: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
end
