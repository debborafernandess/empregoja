class CreateJob < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :company
      t.text :description
      t.string :location
      
      t.timestamps
    end
  end
end
