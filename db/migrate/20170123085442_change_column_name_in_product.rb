class ChangeColumnNameInProduct < ActiveRecord::Migration
  def change
    rename_column :products, :name, :product_name
  end
end
