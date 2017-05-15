class CreateSlips < ActiveRecord::Migration
  def change
    create_table :slips do |t|
      t.integer       :number
      t.references    :boat, :null => true
      t.datetime      :arrival_date, :null => true
      t.timestamps    :null => false
    end
  end
end
