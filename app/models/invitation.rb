class Invitation < ActiveRecord::Base
  attr_accessible :email, :note, :role

  belongs_to  :list

end
