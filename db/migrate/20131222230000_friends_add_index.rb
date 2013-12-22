class FriendsAddIndex < ActiveRecord::Migration

  def change  
  add_index :friends, :user_id
  add_index :friends, :friend_id
  add_index :friends, [:user_id, :friend_id], unique: true
  end
end
