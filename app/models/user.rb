class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lines, through: :attended_events, source: :lines
  has_many :users_attend_events_relationships
  has_many :users_favorite_events_relationships
  has_many :attended_events, through: :users_attend_events_relationships, source: :event
  has_many :favorited_events, through: :users_favorite_events_relationships, source: :event

end
