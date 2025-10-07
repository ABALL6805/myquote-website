class MakeAuthorFnameNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :authors, :fname, false
  end
end
