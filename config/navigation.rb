# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|


    primary.item :home, 'Strona główna', root_path, unless: -> { signed_in? }
    primary.item :register, 'Zarejestruj się', new_user_registration_path, unless: -> { signed_in? }
    primary.item :log_in, 'Zaloguj się', new_user_session_path, unless: -> { signed_in? }

    primary.item :panel, 'Panel', root_path, if: -> { signed_in? }
    primary.item :shops, 'Sklepy', shops_path, if: -> { signed_in? }
    primary.item :receipts, 'Paragony', receipts_path, if: -> { signed_in? }
    primary.item :log_out, 'Wyloguj się', destroy_user_session_path, :method => :delete, if: -> { signed_in? }

    # Add an item which has a sub navigation (same params, but with block)
 #   primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
 #     sub_nav.item :key_2_1, 'name', url, options
  #  end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
#    primary.item :key_3, 'Admin', url, class: 'special', if: -> { current_user.admin? }
 #   primary.item :key_4, 'Account', url, unless: -> { logged_in? }

    # you can also specify html attributes to attach to this particular level
    # works for all levels of the menu
    # primary.dom_attributes = {id: 'menu-id', class: 'menu-class'}

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  end
end
