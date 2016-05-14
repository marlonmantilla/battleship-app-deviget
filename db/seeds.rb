
player1 = User.find_or_create_by!(name: "Player 1", status: User::STATUS_PREPARING )
player2 = User.find_or_create_by!(name: "Player 2", status: User::STATUS_PREPARING)

Board.find_or_create_by!(user: player1, positions: {"a" => [], "b" => [], "c" => [], "d" => [], "e" => [], "f" => [], "g" => [], "h" => [], "i" => [], "j" => []})
Board.find_or_create_by!(user: player2, positions: {"a" => [], "b" => [], "c" => [], "d" => [], "e" => [], "f" => [], "g" => [], "h" => [], "i" => [], "j" => []})

Ship.find_or_create_by!(name: "Aircraft carrier", size: 5)
Ship.find_or_create_by!(name: "Battleship", size: 4)
Ship.find_or_create_by!(name: "Submarine", size: 3)
Ship.find_or_create_by!(name: "Destroyer", size: 2)
Ship.find_or_create_by!(name: "Patrol boat", size: 2)