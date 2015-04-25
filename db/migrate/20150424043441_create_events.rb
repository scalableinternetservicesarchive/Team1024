class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name, null: false
      t.integer :max_attendance, null: false
      t.datetime :start_time, null: false
      t.datetime :create_time, null: false
      t.text :description, null: true
      ## TODO: picture field

      t.timestamps null: false
    end
  end
end
