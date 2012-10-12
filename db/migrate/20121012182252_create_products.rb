class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string      :name
      t.references  :category
      t.references  :user
      t.timestamps
    end
  end
end