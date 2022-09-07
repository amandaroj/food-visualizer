class AddDescriptionToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :description, :text
  end
end
