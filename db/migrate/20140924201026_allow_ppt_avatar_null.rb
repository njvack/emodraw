class AllowPptAvatarNull < ActiveRecord::Migration
  def change
    change_column :participants, :avatar_id, :integer, :null => true
  end
end
