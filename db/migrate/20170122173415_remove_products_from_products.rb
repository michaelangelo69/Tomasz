class RemoveProductsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :Products, :string
  end
end
