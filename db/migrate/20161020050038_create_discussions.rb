class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
