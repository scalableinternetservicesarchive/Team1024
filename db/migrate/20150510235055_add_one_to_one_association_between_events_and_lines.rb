class AddOneToOneAssociationBetweenEventsAndLines < ActiveRecord::Migration
  def change
    change_table :lines do |t|
      t.belongs_to :event, index: true
    end
  end
end
