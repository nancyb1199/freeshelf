class RemoveOwnerFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :owner, :string
  end
end
