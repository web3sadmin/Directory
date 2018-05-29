class AddColumntToIndices < ActiveRecord::Migration[5.1]
  def change
    add_column :indices, :sAMAccountName, :string
  end
end
