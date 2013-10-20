class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.int :user_id
      t.int :friend_id

      t.timestamps
    end
  end
end
