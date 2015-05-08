class AddEssentialColumnsToManagers < ActiveRecord::Migration
  def change
    change_table(:managers) do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
    end
  end
end
