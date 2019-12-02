class UserPick < ApplicationRecord
  belongs_to :user 
  belongs_to :contest_prop
end
