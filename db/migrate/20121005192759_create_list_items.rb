class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string      :quantity
      t.text        :note
      t.references  :category
      t.references  :product
      t.references  :list
      t.references  :user
      t.timestamps
    end
  end
end
