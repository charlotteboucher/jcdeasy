class AddAdArtToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :ad_art, :string
  end
end
