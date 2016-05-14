class Attack < ActiveRecord::Base
  belongs_to :user
  belongs_to :attacker, class_name: 'User'

  validates :user, :attacker, :coor_x, :coor_y, presence: true
  validates :coor_x, uniqueness: { scope: [:coor_y, :user] }

end
