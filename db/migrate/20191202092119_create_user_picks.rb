class CreateUserPicks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_picks do |t|
      t.integer :user_id  
      t.integer :contest_prop_id
      t.boolean :locked, default: false
      t.boolean :scored, default: false
      t.boolean :side_won
      t.string :side
      t.float :confidence

      t.timestamps
    end
  end
end
