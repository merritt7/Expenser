class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.primary_key :id
      t.string :description
      t.decimal :amount
      t.decimal :latitude
      t.decimal :longitude
      t.integer :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
