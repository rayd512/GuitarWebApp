class CreateGuitars < ActiveRecord::Migration[6.1]
  def change
    create_table :guitars do |t|
      t.string :name
      t.string :brand
      t.string :price
      t.string :serial
      t.string :img
      t.string :uid

      t.timestamps
    end
  end
end
