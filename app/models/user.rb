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
  attr_accessible :display_name,
    :email,
    :password,
    :password_confirmation,
    :remember_me

  has_many :list_users, :dependent => :destroy
  has_many :lists, :through => :list_users, :dependent => :destroy



  def add_list
    lists << List.new({:user_id => id})
  end

end
