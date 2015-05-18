class Event < ActiveRecord::Base
  has_one :line, inverse_of: :event
  belongs_to :manager, inverse_of: :events
  has_many :users_attend_events_relationships
  has_many :users_favorite_events_relationships
  has_many :attending_users, through: :users_attend_events_relationships, source: :user
  has_many :favoriting_users, through: :users_favorite_events_relationships, source: :user
  has_attached_file :event_photo, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :event_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  searchable do
    text :name
    text :description 
  end

end
