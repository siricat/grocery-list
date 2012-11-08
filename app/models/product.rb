class Product < ActiveRecord::Base
  attr_accessible :name, :category

  belongs_to  :list
  belongs_to  :category

end
