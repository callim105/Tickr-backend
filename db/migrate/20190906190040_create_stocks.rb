class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.string :sector
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
