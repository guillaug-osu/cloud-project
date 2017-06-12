class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string          :email, :null => false, :limit => 255
      t.string          :password_hash
      t.string          :password_salt
      t.string          :authentication_token, :null => true, :limit => 255
      t.integer         :sign_in_count, :default => 0
      t.string          :role, :null => false, :limit => 255
      t.timestamps null: false
    end
  end
end
