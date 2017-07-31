class CreateTableRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :url
    end
  end
end
