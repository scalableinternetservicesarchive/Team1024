class AddLineStartTimeToEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.datetime :line_start_time
    end
  end
end
