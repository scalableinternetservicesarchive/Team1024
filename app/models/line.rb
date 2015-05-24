class Line < ActiveRecord::Base
	belongs_to :event, inverse_of: :line
  has_many :users_and_lines_relationships
  has_many :users, through: :users_and_lines_relationships, source: :user
end
