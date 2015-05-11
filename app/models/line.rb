class Line < ActiveRecord::Base
	belongs_to :event, inverse_of: :line
  has_many :users, through: :event
end
