class CreateContestBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_boards do |t|
      t.string :name

      t.timestamps
    end
  end
end
