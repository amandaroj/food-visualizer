class AddAverageratingToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :average_rating, :decimal, default: 0
  end
end
