class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:edit, :update, :destroy]
  before_action :check_login
  before_action :calculate_ratings, only: [:index]


  #before_filter :authorize, :except => [:index, :show, :new, :create]

  respond_to :html, :xml, :json


  def calculate_ratings

    shops = Shop.all


    shops.each do |shop|

    examination_time = ComplaintReview.joins(complaint: {article: {receipt: :shop}}).
        where(shops: {id: shop.id}).sum(:examination_time)

    client_approach = ComplaintReview.joins(complaint: {article: {receipt: :shop}}).
        where(shops: {id: shop.id}).sum(:client_approach)

    satisfaction = ComplaintReview.joins(complaint: {article: {receipt: :shop}}).
        where(shops: {id: shop.id}).sum(:satisfaction)

    sum = examination_time+client_approach+satisfaction

    @count = ComplaintReview.
        joins(complaint: {article: {receipt: :shop}}).
        where(shops: {id: shop.id}).
        count*3

    @overall_rating = (sum.to_f/@count).round(2)

    if (@count == 0)
      shop.update_column(:overall_rating, 0)
    else
      shop.update_column(:overall_rating, @overall_rating)
    end

    end

  end

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
      @shops = Shop.__elasticsearch__.search(params[:query]).records
    else
      @shops = Shop.all.order(overall_rating: :desc)
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
