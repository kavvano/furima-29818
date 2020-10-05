class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :post_num, null: false
      t.integer :area_id, null: false
      t.string :city,     null: false
      t.string :address,  null: false
      t.string :building
      t.string :cell_num, null: false
      t.references :link, null: false, foreign_key: true
      t.timestamps
    end
  end
end
