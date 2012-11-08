class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string      :name
      t.references  :user
      t.timestamps
    end
  end
end
