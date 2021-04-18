class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role_id, :integer, default: user_role
  end

  private
  def user_role
    Role.find_by_name('user').id
  end
end
