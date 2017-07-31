class CreateTableRecipes < ActiveRecord::Migration[4.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :url
    end
  end
end
