class List < ActiveRecord::Base

  after_create :owner_subscription

  attr_accessible :name

  validates :name, :presence => true

  belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  has_many  :list_items, :dependent => :destroy
  has_many  :products, :dependent => :destroy

  has_many  :list_users
  has_many  :users, :through => :list_users

private

  def owner_subscription
    list_user = ListUser.new
    list_user.user = User.find(self.user_id)
    list_user.list = self
    list_user.save
  end

end
