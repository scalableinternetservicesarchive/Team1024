class CreateFakeUsers < ActiveRecord::Migration
  def change
    create_table :fake_users do |t|
      t.string :phone_number, null: false
      t.integer :lives, null: false
      t.integer :position, null: false
      t.integer :score, null: false
      t.integer :checkin_count, null: false
      t.integer :continuous_checkin_count, null: false
      t.integer :missed_checkin_count, null: false
      t.integer :delta_value, null: false
      t.boolean :checkin_current_period, null: false
      t.boolean :first_try, null: false
      t.boolean :robot, null: false
      t.datetime :send_notification_time, null: false
      t.string :notification_option, null: false
      t.boolean :send_notification, null: false # original send_period_notification
      t.datetime :notification_deadline, null: false # original deadline_receive_notification

      t.timestamps null: false

    end
  end
end
