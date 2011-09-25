class AddTotalToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :total, :float
  end

  def self.down
    remove_column :categories, :total
  end
end
