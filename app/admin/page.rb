#encoding: utf-8

ActiveAdmin.register Article do
  #menu label: "Sklepy"

  permit_params :name, :brand, :user_id, :warranty_time, :already_complained, :warranty_expires, :receipt_id, :_destroy


  index :title => 'Artykuły' do
    selectable_column

    column "Nazwa", :name, :class => 'center', :sortable => :name do |article|
      link_to article.name, admin_article_path(article)
    end

    column "Marka", :brand, :class => 'center'

    column "Liczba miesięcy gwarancji", :warranty_time, :class => 'center'
    column "Gwarancja wygasa", :warranty_expires, :class => 'center'

    column "Utworzono", :created_at, :class => 'center'
    column "Zaktualizowano", :updated_at, :class => 'center'

    column "Widnieje na paragonie", :class => 'center' do |r|
      link_to Receipt.find(r.receipt_id).name, admin_article_path(r)
    end

    column "Utworzył użytkownik", :class => 'center' do |u|
      user = User.find(u.user_id).email
    end

    column "Czy już zareklamowano?", :already_complained, :class => 'center'



    actions
  end

  form do |f|
    f.inputs "Utwórz nowy artykuł" do
      f.input :name, :label => 'Nazwa'
      f.input :brand, :label => 'Marka'
      f.input :warranty_time, :label => 'Okres gwarancyjny (w mies.)'
      f.input :receipt_id, label: "Należy do paragonu", :as => :select, :collection => Receipt.all.map{|u| ["#{u.name}", u.id]}
      f.input :warranty_expires, :label => 'Gwarancja wygasa'
      f.input :already_complained, :label => 'Czy już zareklamowano?'
      f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}

    end
    f.actions
  end


end