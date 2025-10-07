class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.text :quote, null: false
      t.integer :pub_year
      t.text :comment
      t.boolean :is_visible, default: true
      t.date :upload_date, default: -> {"CURRENT_DATE"}
      t.references :user, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
