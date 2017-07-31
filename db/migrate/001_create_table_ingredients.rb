class CreateTableIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type
    end
  end
end
