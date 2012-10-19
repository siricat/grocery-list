ActiveAdmin.register Category do

  index do
    column :id
    column :name
    column "Created on", :created_at
    default_actions
  end

  form do |f|
    f.inputs "Name" do
      f.input :name
    end
    f.buttons
  end

  filter :name

  config.sort_order = "name_asc"
  config.per_page = 50

end
