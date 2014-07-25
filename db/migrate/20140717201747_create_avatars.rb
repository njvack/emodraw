class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :experiment, :null => false
      t.string :name, :null => false
      t.boolean :active, :null => false, :default => true
      t.timestamps
    end
  end
end
