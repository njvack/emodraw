class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :imageable_type, :null => false
      t.integer :imageable_id, :null => false
      t.string :type, :null => false
      t.string :content_type, :null => false
      t.integer :height
      t.integer :width
      t.binary :data

      t.timestamps
      t.index [:type, :imageable_type, :imageable_id]
    end
  end
end
