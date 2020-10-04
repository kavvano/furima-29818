class AddSoldOutToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sold_out, :boolean, null: false, default: false
  end
end
