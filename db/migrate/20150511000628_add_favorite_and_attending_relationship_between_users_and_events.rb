class AddFavoriteAndAttendingRelationshipBetweenUsersAndEvents < ActiveRecord::Migration
  def change

    create_table :users_attend_events_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps null: false
    end

    create_table :users_favorite_events_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps null: false
    end

  end
end
