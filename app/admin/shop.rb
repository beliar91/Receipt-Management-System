ActiveAdmin.register Shop, as: "Sklep" do

  menu label: "Sklepy"

  index :title => 'Sklepy' do

    column "Nazwa", :name do |shop|
    link_to shop.name, admin_sklep_path(shop)
    end

    column "Ulica", :street
    column "Miasto", :city
    column :email
    column "Telefon", :telephone
    column "Utworzono", :created_at
    column "Zaktualizowano", :updated_at
    column "Szerokość geogr.", :latitude
    column "Długość geogr", :longitude

  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end






end
