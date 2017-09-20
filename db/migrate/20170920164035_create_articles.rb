class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end
