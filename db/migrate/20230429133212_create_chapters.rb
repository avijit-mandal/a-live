class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
    	t.string :title
    	t.text :content
    	t.integer :chapter_index
    	t.references :book, index: true
      t.timestamps
    end
  end
end
