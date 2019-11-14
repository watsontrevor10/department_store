class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.float :price
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
