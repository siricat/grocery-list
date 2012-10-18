ActiveAdmin.register User do
  
  index do                         
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
  
end
