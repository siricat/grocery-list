class Category < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to  :user
  
  def title
    name.titleize
  end
  
  def to_param
    name.parameterize.underscore
  end
end
