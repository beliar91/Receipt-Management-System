#encoding: utf-8
class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  respond_to :html, :xml, :json

  def check_auth
    user_id = current_user.id
    user = current_user
    if user.admin?
      return true
    end

      if user_id != @complaint.user_id
        flash[:error] = "Przykro mi, nie masz uprawnien do tej reklamacji."
        redirect_to complaints_path
      end

  end


  def index
    @complaints = current_user.complaints


    respond_with(@complaints)
  end

  def edit

  end

  def update
    @complaint.update(complaint_params)
    respond_with(@complaint)
  end


  def destroy
    @complaint.destroy
    respond_with(@complaint)
  end

  def show
    respond_with(@complaint)
  end


  def create
    @complaint = Complaint.new(complaint_params)
    user_id = current_user.id
    @complaint.user_id = user_id


    @complaint.complaint_status_id=1
    @complaint.save
    flash[:notice] = "Twoja reklamacja została utworzona. Musi teraz zostać zaakceptowana przez administratora."
    respond_with(@complaint)
  end


  def new
    @complaint = Complaint.new
    respond_with(@complaint)
  end


  private
  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:reason, :user_id, :complaint_status_id, :article_id)
  end


end
