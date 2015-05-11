class AddOneToManyAssociationBetweenManagersAndEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.belongs_to :manager, index: true
    end
  end
end
