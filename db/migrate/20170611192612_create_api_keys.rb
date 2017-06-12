class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string      :key, :null => false, :limit => 255
      t.references  :user,   nil: false
      t.timestamps  null: false
    end
  end
end
