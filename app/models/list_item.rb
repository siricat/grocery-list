class ListItem < ActiveRecord::Base
  attr_accessible :quantity, :note
  attr_accessor :name
  
  belongs_to  :list
  belongs_to  :product
  belongs_to  :user
end
