class Event < ActiveRecord::Base
  has_one :line, inverse_of: :event
  belongs_to :manager, inverse_of: :events
  has_many :users_attend_events_relationships
  has_many :users_favorite_events_relationships
  has_many :attending_users, through: :users_attend_events_relationships, source: :user
  has_many :favoriting_users, through: :users_favorite_events_relationships, source: :user
  has_many :event_pictures
  accepts_nested_attributes_for :event_pictures
  searchable do
    text :name
    text :description 
  end

end
