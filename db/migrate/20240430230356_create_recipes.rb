class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :menu
      t.text :material
      t.text :process
      t.string :image

      t.timestamps
    end
  end
end
