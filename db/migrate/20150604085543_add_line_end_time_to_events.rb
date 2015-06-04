class AddLineEndTimeToEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.datetime :line_end_time
    end
  end
end
