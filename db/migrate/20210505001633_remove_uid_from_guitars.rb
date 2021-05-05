class RemoveUidFromGuitars < ActiveRecord::Migration[6.1]
  def change
    remove_column :guitars, :uid, :string
  end
end
