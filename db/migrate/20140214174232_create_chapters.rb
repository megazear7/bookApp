class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.belongs_to :book
      t.string :title
      t.text :content
      t.integer :position
      t.timestamps
    end
  end
end
