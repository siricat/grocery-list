class List < ActiveRecord::Base
  attr_accessible :name, :user_id


  has_many  :list_items, :dependent => :destroy
  has_many  :products, :dependent => :destroy

  has_many  :list_users
  has_many  :users, :through => :list_users

end
