#encoding: utf-8

ActiveAdmin.register StaticPage do

  permit_params :title, :content, :user_id


  index :title => 'Strony Statyczne' do
    selectable_column

    column "Tytuł", :name, :sortable => :title do |page|
      link_to page.title, admin_static_page_path(page)
    end

    column "Zawartość", :content

    column "Utworzył użytkownik" do |u|
      user = User.find(u.user_id).email
    end

    actions
  end

  form do |f|
    f.inputs "Utwórz nowy artykuł" do
      f.input :title, :label => 'Tytuł'
      f.input :content, :label => 'Zawartość'
      f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}

    end
    f.actions
  end


end