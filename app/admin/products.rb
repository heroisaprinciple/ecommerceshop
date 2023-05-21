ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price, :amount_left, :description, :category_id, :sales_count, :stripe_price_id, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :amount_left, :description, :category_id, :sales_count, :stripe_price_id, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.sort_order = "id_asc"

  permit_params :name, :price, :description, :amount_left, :category_id, :sales_count, :stripe_price_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description, as: :text
      f.input :category, as: :select, collection: Category.all
      f.input :stripe_price_id
    end
    f.actions
  end
end
