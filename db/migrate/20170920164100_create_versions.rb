class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.references :article
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :published, null: false
      t.integer :editor_id, index: true
      t.references :category

      t.timestamps
    end
  end
end
