class AddUserToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :user_id, :integer

    remove_column :comments, :commenter, :string
  end
end
