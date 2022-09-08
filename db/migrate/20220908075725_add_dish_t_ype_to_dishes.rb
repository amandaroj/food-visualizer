class AddDishTYpeToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :dish_type, :integer, default: 0
  end
end
