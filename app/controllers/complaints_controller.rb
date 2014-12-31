class ComplaintsController < ApplicationController
  before_action :check_auth, only: [:show, :edit, :update, :destroy]
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json


  def create
    @complaint = Complaint.new(complaint_params)
    user_id = current_user.id
    @complaint.user_id = user_id
    @complaint.complaint_status_id=1
    @complaint.save
    respond_with(@complaint)
  end


  def new
    @complaint = Complaint.new
    respond_with(@complaint)
  end


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


  private
  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:reason, :reject_reason, :user_id, :complaint_status_id, :article_id)
  end


end
