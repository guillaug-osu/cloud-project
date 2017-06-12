class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string          :name, :null => false, :limit => 255
      t.string          :author, :null => false, :limit => 255
      t.string          :genre, :null => false, :limit => 255
      t.references      :user,   nil: false
      t.timestamps      null: false
    end
  end
end
