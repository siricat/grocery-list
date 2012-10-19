ActiveAdmin.register User do

  index do
    column :id
    column :display_name
    column :email
    column "Current Sign In", :current_sign_in_at
    column "Last Signed in", :last_sign_in_at
    column "Created on", :created_at
    default_actions
  end

end
