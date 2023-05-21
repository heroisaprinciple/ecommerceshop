ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :priority, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :priority, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  config.sort_order = "id_asc"

  permit_params :name, :priority

  form do |f|
    f.inputs do
      f.input :name
      f.input :priority
    end
    f.actions
  end
end
