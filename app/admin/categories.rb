ActiveAdmin.register Category do

  form do |f|
    f.inputs "Name" do
      f.input :name
    end
    f.buttons
  end

  filter :name

  config.sort_order = "name_asc"

end
