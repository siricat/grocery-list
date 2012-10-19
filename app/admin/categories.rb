ActiveAdmin.register Category do
  
  index do   
    selectable_column                          
    column :id                  
    column :name        
    column "Created on", :created_at    
    default_actions                   
  end  
    
  filter :name
  
  config.sort_order = "name_asc"
  config.per_page = 50
  
  form do |f|
    f.inputs "New Category" do
      f.input :name
    end
    f.buttons
  end
  
  batch_action :destroy, :confirm => "Are you sure you want to delete all of these?" do |selection|
    Category.find(selection).each { |c| c.destroy }
    redirect_to collection_path, :notice => "Selected categories deleted."
  end
  
end
