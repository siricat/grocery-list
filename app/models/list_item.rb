class ListItem < ActiveRecord::Base
  attr_accessible :quantity, :note, :category_id
  attr_accessor :name
  
  belongs_to  :list
  belongs_to  :category
  belongs_to  :product
  belongs_to  :user
  
  default_scope :order => 'position ASC'
  
  scope :by_category, lambda { |category| {
    :conditions => { :category_id => category.id }
  }}
  
  include RankedModel
  ranks :position, :with_same => :list_id
  
end
