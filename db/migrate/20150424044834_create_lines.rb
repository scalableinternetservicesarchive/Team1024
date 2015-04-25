class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :status, null: false
      t.boolean :already_start, null: false
      t.datetime :start_time, null: false # original line_time
      t.datetime :end_time, null: false
      t.datetime :next_checkin_time, null: false
      t.integer :number_of_fake_user, null: false
      t.integer :min_score, null: false
      t.integer :max_score, null: false

      t.timestamps null: false
    end
  end
end
