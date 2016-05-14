class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user, index: true, foreign_key: true
      t.json :positions

      t.timestamps null: false
    end
  end
end
