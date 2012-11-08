class CreateListUsers < ActiveRecord::Migration
  def change
    create_table :list_users do |t|
      t.references  :list
      t.references  :user
      t.references  :role
      t.timestamps
    end
  end
end
