class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :budget, :decimal, default: 0.0
    add_column :users, :category_id, :integer
    add_column :users, :subcategory_id, :integer
  end
end
