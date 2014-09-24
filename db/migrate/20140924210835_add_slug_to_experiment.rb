class AddSlugToExperiment < ActiveRecord::Migration
  def change
    add_column :experiments, :url_slug, :string, :null => false
    add_index :experiments, :url_slug, :unique => true
  end
end
