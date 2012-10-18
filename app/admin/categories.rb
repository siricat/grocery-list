ActiveAdmin.register Category do
  
  form do |f|
    f.inputs "Name" do
      f.input :name
    end
    f.buttons
  end
  
end
