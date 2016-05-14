class User < ActiveRecord::Base
  STATUS_PREPARING = "preparing"
  STATUS_READY = "ready"
  STATUSES = [STATUS_PREPARING, STATUS_READY]

  validates :name, presence: true
  validates :status, inclusion: {in: STATUSES}

  has_one :board, dependent: :destroy
  has_many :attacks, dependent: :destroy
  has_many :user_attacks, dependent: :destroy, class_name: 'Attack', foreign_key: 'attacker_id'

  def ready?
    status == STATUS_READY
  end

  def attacked?(x, y)
    user_attacks.find_by(coor_x: x, coor_y: y).present?
  end

end
