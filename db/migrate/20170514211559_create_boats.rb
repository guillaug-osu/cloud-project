class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string          :name
      t.string          :boat_type
      t.integer         :length
      t.boolean         :at_sea, :default => false
      t.timestamps null: false
    end
  end
end
