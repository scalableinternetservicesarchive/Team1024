class AddAttachmentEventPhotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :event_photo
    end
  end

  def self.down
    remove_attachment :events, :event_photo
  end
end
