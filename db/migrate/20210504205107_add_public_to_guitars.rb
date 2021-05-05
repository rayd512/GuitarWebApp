class AddPublicToGuitars < ActiveRecord::Migration[6.1]
  def change
    add_column :guitars, :public, :boolean
  end
end
