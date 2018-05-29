class AddColumnToIndex < ActiveRecord::Migration[5.1]
  def change
    add_column :indices, :registered, :boolean
  end
end
