#encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end


    section "Ostatnio dodane sklepy" do
      table_for Shop.order("created_at desc").limit(5) do
        column "Nazwa sklepu", :name
        column "Ulica", :street
        column "Miasto", :city
        column "Utworzono", :created_at
      end
      strong { link_to "Przeglądaj wszystkie sklepy", admin_shops_path }

    end





    br do

    end

    section "Ostatnio dodane paragony" do
      table_for Receipt.order("created_at desc").limit(5) do
        column "Nazwa paragonu", :name
        column "Data zakupów", :shopping_date
        column "Utworzył użytkownik" do |u|
          user = User.find(u.user_id).email
        end
        column "Zakupiono w sklepie", :class => 'center' do |s|
          link_to sklep = Shop.find(s.shop_id).name, admin_shop_path(s.shop)
        end
        column "Utworzono", :created_at
      end
      strong { link_to "Przeglądaj wszystkie paragony", admin_receipts_path }
    end

    br do

    end

    section "Ostatnio dodane artykuły" do
      table_for Article.order("created_at desc").limit(5) do
        column "Nazwa artykułu", :name_with_brand
        column "Gwarancja wygasa", :warranty_expires
        column "Utworzono", :created_at
      end
      strong { link_to "Przeglądaj wszystkie paragony", admin_receipts_path }
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
