class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :string
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
