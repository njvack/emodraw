class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.references :experiment, :null => false
      t.string :text, :null => false
      t.integer :position, :null => false, :default => 0
      t.timestamps
    end
  end
end
