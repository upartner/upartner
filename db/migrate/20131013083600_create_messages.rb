class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user_id
      t.string :message_id
      t.string :title
      t.text :message
      t.string :image_url
      t.timestamps
    end
  end
end
