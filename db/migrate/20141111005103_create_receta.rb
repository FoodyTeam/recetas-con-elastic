class CreateReceta < ActiveRecord::Migration
  def change
    create_table :receta do |t|
      t.string :titulo
      t.text :ingredientes
      t.text :modo_preparacion

      t.timestamps
    end
  end
end
