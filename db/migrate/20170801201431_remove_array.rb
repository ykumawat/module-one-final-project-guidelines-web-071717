class RemoveArray < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :category, :text
    rename_column :recipes, :steps, :directions
    rename_column :recipes, :name, :title
    remove_column :recipes, :url
    remove_column :recipes, :cuisine
    remove_column :recipes, :ing_array
  end
end
