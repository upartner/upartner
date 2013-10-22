class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer  "user_id"
      t.string   "title"
      t.text     "message"
      t.string   "image_url"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
