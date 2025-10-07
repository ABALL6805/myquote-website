class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :fname, null: false
      t.string :lname
      t.integer :birth_year
      t.integer :death_year

      t.timestamps
    end
  end
end
