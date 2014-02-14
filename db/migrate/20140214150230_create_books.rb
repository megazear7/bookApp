class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :short_description
      t.text :long_description
      t.timestamps
    end
  end
end
