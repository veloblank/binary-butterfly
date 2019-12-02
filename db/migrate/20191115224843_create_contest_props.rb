class CreateContestProps < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_props do |t|
      t.string :title
      t.datetime :date
      t.datetime :start_time
      t.string :sport
      t.string :home_team
      t.string :away_team
      t.integer :contest_board_id


      t.timestamps
    end
  end
end
