class CreateUserContestBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_contest_boards do |t|
      t.integer :user_id
      t.integer :contest_board_id

      t.timestamps
    end
  end
end
