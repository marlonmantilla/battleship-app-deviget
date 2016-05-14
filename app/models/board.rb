class Board < ActiveRecord::Base
  belongs_to :user
  VALID_POSITIONS = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

  # Validations
  validates :user, presence: true

  def add_ship!(ship_position)
    if ship_position.present?
      ship_position.each do |k,v|
        if valid_position?(k)
          if positions.has_key?(k)
            raise "positions was taken" if positions[k].include? v
            if v.is_a? Array
              v.each{|j| positions[k].push(j) }
            else
              positions[k].push v
            end
          else
            positions[k] = [v].flatten
          end
        else
          raise "invalid position #{k}"
        end
      end
      save
    end
  end

  def attacked?(x,y)
    user.attacks.find_by(coor_x: x, coor_y: y) && positions[x].include?(y)
  end

  def ship_positioned?(x, y)
    if positions.has_key?(x)
      positions[x].include? y
    end
  end

  def valid_position?(position)
    VALID_POSITIONS.include? position
  end

end
