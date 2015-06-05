class UsersFavoriteEventsRelationship < ActiveRecord::Base
  belongs_to :userUsersFavoriteEventsRelationship
  belongs_to :event
end
