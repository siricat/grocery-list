class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string      :name, :null => false
      t.references  :category, :null => false
      t.references  :user, :null => false
      t.timestamps
    end
  end
end