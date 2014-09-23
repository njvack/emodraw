class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :participant_tag, :null => false
      t.references :experiment, :null => false
      t.references :avatar, :null => false
      t.index [:experiment_id, :participant_tag], :unique => true

      t.timestamps
    end
  end
end
