class AddColumnsToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :body, :string
    add_column :articles, :category_id, :integer
    add_column :articles, :published, :boolean, null: false, default: false
  end
end

