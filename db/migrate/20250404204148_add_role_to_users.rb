class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer, default: 4
  end
end
