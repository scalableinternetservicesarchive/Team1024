class AddLineStatusToEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.integer :line_status, default: 0
    end
  end
end
