class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :participant, :null => false
      t.references :prompt, :null => false
      t.boolean :completed, :null => false, :default => false
      t.index [:participant_id, :prompt_id], :unique => true
      t.timestamps
    end
  end
end
