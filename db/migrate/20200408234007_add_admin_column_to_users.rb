class AddAdminColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :operator, :boolean, default: false
  end
end
