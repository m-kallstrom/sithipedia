class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :aws_link

      t.timestamps
    end
  end
end
