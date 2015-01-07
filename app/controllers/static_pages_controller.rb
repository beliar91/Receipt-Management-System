#encoding: utf-8
class StaticPagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]


  respond_to :html, :xml, :json

  def show
    respond_with(@static_page)
  end

  def new
    @static_page = StaticPage.new
    respond_with(@static_page)
  end

  def edit
  end

  def create
    @static_page = StaticPage.new(page_params)
    user_id = current_user.id
    @static_page.user_id = user_id
    @static_page.save
    respond_with(@static_page)
  end

  def update
    @static_page.update(page_params)
    respond_with(@static_page)
  end

  def destroy
    @static_page.destroy
    @static_page.tire.update_index
    flash[:notice] = "Pomyslnie usunieto strone statyczna."
    redirect_to shops_path
  end


  private

  def set_page
    @static_page = StaticPage.find(params[:id])
  end

  def page_params
    params.require(:static_page).permit(:title, :content, :user_id)
  end


end
