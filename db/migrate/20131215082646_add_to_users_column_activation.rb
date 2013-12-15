class AddToUsersColumnActivation < ActiveRecord::Migration
  def change
        add_column :users, :activation, :boolean, :null => false, :default => false
  end
end
