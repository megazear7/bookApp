class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :short_description
      t.text :long_description
      vvvv#before rake db:migrate add has_many relationship
      t.timestamps
    end
  end
end
