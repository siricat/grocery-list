class Product < ActiveRecord::Base
  attr_accessible :name, :category
  
  belongs_to  :user
  belongs_to  :category
  
end
