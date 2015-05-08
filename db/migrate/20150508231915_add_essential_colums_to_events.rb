class AddEssentialColumsToEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.string :name
      t.integer :max_attendance
      t.datetime :start_time
      t.datetime :create_time
      t.text :description
    end
  end
end
