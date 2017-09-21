class AddColumnsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :body, :string
    add_column :articles, :category_id, :integer
  end
end

