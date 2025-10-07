class CreateBiographies < ActiveRecord::Migration[8.0]
  def change
    create_table :biographies do |t|
      t.text :biography
      t.references :quote, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
