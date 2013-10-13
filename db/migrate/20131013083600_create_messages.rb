class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id
      t.string :title
      t.text :message
      t.string :image_url
      t.timestamp :create_time
      t.timestamp :update_time

      t.timestamps
    end
  end
end
