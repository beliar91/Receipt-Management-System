class ReceiptsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json


  def check_auth
    user_id = current_user.id
    user = current_user
    if user.admin?
      return true
    end
    if user_id != @receipt.user_id
      flash[:error] = "Przykro mi, nie masz uprawnien do tego paragonu."
      redirect_to receipts_path
    end
  end

  def index
    @receipts = current_user.receipts


    respond_with(@receipts)
  end

  def show
    respond_with(@receipt)
  end

  def new
    @receipt = Receipt.new
    2.times do
      @receipt.articles.build
    end
    respond_with(@receipt)
  end

  def edit
  end

  def create
    @receipt = Receipt.new(receipt_params)
    user_id = current_user.id


    @receipt.articles.each do |article|
      warranty_time = article.warranty_time
      article.warranty_expires = @receipt.shopping_date.advance(months: warranty_time)
    end

    @receipt.user_id = user_id
    @receipt.save
    respond_with(@receipt)
  end

  def update
    @receipt.update(receipt_params)
    respond_with(@receipt)
  end

  def destroy
    @receipt.destroy
    respond_with(@receipt)
  end

  private

  def set_shop
    @receipt = Receipt.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(:name, :shopping_date, :shop_id, :file, articles_attributes: [ :id, :name, :brand, :warranty_time, :warranty_expires, :receipt_id, :_destroy ])
  end


end
