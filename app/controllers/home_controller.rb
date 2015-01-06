class HomeController < ApplicationController

  before_filter :set_static_pages


  def index
    if user_signed_in?
      redirect_to :controller=>'dashboard', :action => 'index'
    end
  end

  def set_static_pages
    @static_pages = StaticPage.all
  end

end
