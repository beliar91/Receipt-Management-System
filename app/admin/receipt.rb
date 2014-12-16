#encoding: utf-8
#validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

ActiveAdmin.register Receipt do

  permit_params :name, :shopping_date, :shop_id, :user_id, :file_file_name, :file_content_type, :file_file_size, :file_updated_at

  form do |f|
    f.inputs "Utwórz nowy paragon", :multipart => true do
      f.input :name
      f.input :shopping_date
      f.input :file, required:false, :as => :file
      f.input :shop_id, label: "Kupiono w sklepie", :as => :select, :collection => Shop.all.map{|u| ["#{u.name}", u.id]}
      f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}

    end
    f.actions
  end

  index  do
    selectable_column



    column "Numer", :id, :class => 'center', :sortable => :id do |receipt|
      link_to receipt.id, admin_receipt_path(receipt)
    end


    column "Nazwa", :name, :class => 'center'

    column :shopping_date, :class => 'center'
    column :created_at, :class => 'center'
    column :updated_at, :class => 'center'
    column "Zakupiono w sklepie", :class => 'center' do |s|
      link_to sklep = Shop.find(s.shop_id).name, admin_shop_path(s.shop)
    end

    column "Utworzył użytkownik", :class => 'center' do |u|
      user = User.find(u.user_id).email
    end

    column :file_file_name, :class => 'center'
    column :file_content_type, :class => 'center'
    column :file_file_size, :class => 'center'
    column :file_updated_at, :class => 'center'



    # column "Utworzono", :created_at, :class => 'center'
    # column "Zaktualizowano", :updated_at, :class => 'center'
    # column "Szerokość geogr.", :latitude, :class => 'center'
    # column "Długość geogr.", :longitude, :class => 'center'

    actions
  end



  #, :class => 'center

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
