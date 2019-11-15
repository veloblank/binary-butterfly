class CreateContestWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_weeks do |t|
      t.string :name

      t.timestamps
    end
  end
end
