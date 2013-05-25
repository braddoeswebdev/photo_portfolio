class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.text :notes
      t.integer :collection_id

      t.timestamps
    end
  end
end
