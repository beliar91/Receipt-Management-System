class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:edit, :update, :destroy]


  #before_filter :authorize, :except => [:index, :show, :new, :create]

  respond_to :html, :xml, :json


  def check_auth
    user_id = current_user.id
    user = current_user
    if user.admin?
      return true
    end
    if user_id != @shop.user_id
      flash[:error] = "Przykro mi, nie mozesz edytowac tego sklepu"
      redirect_to shops_path
    end
  end

  def index
    if params[:query].present?
      @shops = Shop.search(params[:query], load:true).result
    else
      @shops = Shop.all
    end
    respond_with(@shops)
  end

  def show
    respond_with(@shop)
  end

  def new
    @shop = Shop.new
    respond_with(@shop)
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    user_id = current_user.id
    @shop.user_id = user_id
    @shop.save
    respond_with(@shop)
  end

  def update
    @shop.update(shop_params)
    respond_with(@shop)
  end

  def destroy
    @shop.destroy
    @shop.tire.update_index
    flash[:notice] = "Pomyslnie usunieto sklep."
    redirect_to shops_path
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :street, :city, :email, :telephone, :user_id)
    end
end
