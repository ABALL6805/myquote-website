class CreateCategoryQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :category_quotes do |t|
      t.references :category, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
