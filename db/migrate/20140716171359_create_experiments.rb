class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :name, :null => false
      t.boolean :running, :null => false, :default => true
      t.timestamps
    end
  end
end
