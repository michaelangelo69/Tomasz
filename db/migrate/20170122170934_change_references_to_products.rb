class ChangeReferencesToProducts < ActiveRecord::Migration
  def change
       remove_column :products, :shop_id_id, :integer
  end
end
