class Category < ActiveRecord::Base
  attr_accessible :name

  belongs_to  :user
  belongs_to  :list
  has_many    :products

  default_scope :order => 'name ASC'

  def title
    name.titleize
  end

  def to_parameter
    name.parameterize.underscore
  end
end
