class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string      :name
      t.text        :description
      t.references  :list_user
      t.timestamps
    end
  end
end
