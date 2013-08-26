class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :place, index: true
      t.string :title
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
