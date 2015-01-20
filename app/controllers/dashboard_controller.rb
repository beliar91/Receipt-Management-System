class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index

    @shops = Shop.all.order(overall_rating: :desc).limit(5)

  end


end
