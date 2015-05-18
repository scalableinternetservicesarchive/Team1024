class EventPicture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :event
end
