class CreateEventPictures < ActiveRecord::Migration
  def change
    create_table :event_pictures do |t|
      t.integer :event_id
      t.string :image

      t.timestamps null: false
    end
  end
end
