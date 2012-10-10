class User < ActiveRecord::Base
  
  after_create :add_list
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :trackable, 
    :validatable,
    :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name,
    :username,
    :email, 
    :password, 
    :password_confirmation, 
    :remember_me
    
  has_one   :list
  has_many  :products
  
  def add_list
    self.build_list
  end
  
    
  
end
