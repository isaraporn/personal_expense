class AddTotalToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :total, :float
  end

  def self.down
    remove_column :items, :total
  end
end
