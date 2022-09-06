class AddDishTypeToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :dish_type, :string, default: "main"
  end
end
