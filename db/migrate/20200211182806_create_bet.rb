class CreateBet < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.string :race
      t.integer :bet
      t.string :location
      t.integer :better_id
      t.integer :biker_id
    end
  end
end
