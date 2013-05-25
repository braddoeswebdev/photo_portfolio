class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.text :notes
      t.integer :cover_id

      t.timestamps
    end
  end
end
