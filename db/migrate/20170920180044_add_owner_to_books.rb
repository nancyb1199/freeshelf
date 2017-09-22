class AddOwnerToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :owner, :string
  end
end
