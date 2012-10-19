ActiveAdmin.register User do
  
  index do   
    selectable_column                           
    column :id                  
    column :display_name        
    column :email
    column "Created on", :created_at
    column "Last Signed in", :last_sign_in_at    
    column :sign_in_count, :class => "sign_in_count"
    default_actions                   
  end
  
  filter :display_name
  filter :email
  
  config.sort_order = "display_name_asc"
  config.per_page = 50  
  
  form do |f|
    f.inputs "New User" do
      f.input :display_name
      f.input :email
      f.input :encrypted_password
      f.input :reset_password_token
    end
    f.buttons
  end  
  
  batch_action :destroy, :confirm => "Are you sure you want to delete all of these?" do |selection|
    User.find(selection).each { |u| u.destroy }
    redirect_to collection_path, :notice => "Selected users deleted."
  end  
  
end
