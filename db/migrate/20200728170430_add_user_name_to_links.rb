class AddUserNameToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :user_name, :string
  end
end
