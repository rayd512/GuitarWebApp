class AddUserIdToGuitars < ActiveRecord::Migration[6.1]
  def change
    add_column :guitars, :user_id, :integer
    add_index :guitars, :user_id
  end
end
