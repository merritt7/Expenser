class AddLocationToExpense < ActiveRecord::Migration
  def self.up
    add_column :expenses, :location, :string
  end

  def self.down
    remove_column :expenses, :location
  end
end
