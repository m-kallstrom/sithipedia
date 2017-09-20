class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.references :photo
      t.references :version

      t.timestamps
    end
  end
end
