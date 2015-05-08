class AddEssentialColumsToLines < ActiveRecord::Migration
  def change
    change_table(:lines) do |t|
      t.string :status
      t.boolean :already_start
      t.datetime :start_time # original line_time
      t.datetime :end_time
      t.datetime :next_checkin_time
      t.integer :number_of_fake_user
      t.integer :min_score
      t.integer :max_score
    end
  end
end
