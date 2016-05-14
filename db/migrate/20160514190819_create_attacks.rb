class CreateAttacks < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.integer :attacker_id
      t.references :user, index: true, foreign_key: true
      t.string :coor_x
      t.string :coor_y

      t.timestamps null: false
    end
  end
end
