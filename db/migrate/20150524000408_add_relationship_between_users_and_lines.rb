class AddRelationshipBetweenUsersAndLines < ActiveRecord::Migration
  def change
    create_table :users_and_lines_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :line, index: true

      t.integer :score, default: 0
      t.integer :position, default: 0
      t.integer :checkin_count, default: 0
      t.integer :continuous_checkin_count, default: 0
      t.integer :delta_value, default: 0
      t.integer :missed_checkin_count, default: 0
      t.boolean :checkin_current_period, default: false
      t.boolean :first_try, default: false
      t.boolean :robot, default: false
      t.boolean :send_period_notification, default: true
      t.datetime :send_notification_time, default: DateTime.now
      t.datetime :deadline_receive_notification_time, default: DateTime.now

      t.timestamps null: false
    end
  end
end
