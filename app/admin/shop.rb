#encoding: utf-8

ActiveAdmin.register Shop do
  #menu label: "Sklepy"

  permit_params :name, :street, :city, :email, :telephone, :latitude, :longitude, :user_id, :user_email

  batch_action :shop do |selection|
    Shop.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Shops flagged!"
  end


  index :title => 'Sklepy' do
    selectable_column

    column "Nazwa", :name, :class => 'center', :sortable => :name do |shop|
    link_to shop.name, admin_shop_path(shop)
    end


    column "Ulica", :street, :class => 'center'


    column "Miasto", :city, :class => 'center'
    column :email, :class => 'center'
    column "Telefon", :telephone, :class => 'center'
    column "Utworzono", :created_at, :class => 'center'
    column "Zaktualizowano", :updated_at, :class => 'center'
    column "Szerokość geogr.", :latitude, :class => 'center'
    column "Długość geogr.", :longitude, :class => 'center'

    actions
  end

  form do |f|
    f.inputs "Utwórz nowy sklep" do
      f.input :name, :label => 'Nazwa'
      f.input :street, :label => 'Ulica'
      f.input :city, :label => 'Miasto'
      f.input :email
      f.input :telephone, :label => 'Telefon'
      #f.collection_select :id, User.all, :id, :email, :prompt => "Wybierz użytkownika", label: "Utworzył użytkownik"
      f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}

    end
    f.actions
  end


end
