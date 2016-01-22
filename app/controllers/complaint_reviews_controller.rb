class ComplaintReviewsController < ApplicationController
  before_action :set_complaint_review, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  respond_to :html, :xml, :json



  def check_auth
    user_id = current_user.id
    user = current_user
    if user.admin?
      return true
    end

    if user_id != @complaint_review.user_id
      flash[:error] = "Przykro mi, nie masz uprawnien do tej oceny reklamacji."
      redirect_to complaints_path
    end

  end

  def index
    if(current_user.admin?)
      @complaint_reviews = ComplaintReview.all
    else
      @complaint_reviews = current_user.complaint_reviews
    end


    respond_with(@complaint_reviews)
  end

  def new
    @complaint_review = ComplaintReview.new
    respond_with(@complaint_review)
  end

  def create
    @complaint_review = ComplaintReview.new(complaint_review_params)
    user_id = current_user.id
    @complaint_review.user_id = user_id
    @complaint_review.save
    respond_with(@complaint_review)
  end


  def update
    @complaint_review.update(complaint_review_params)
    respond_with(@complaint_review)
  end

  def show

    @sum = @complaint_review.sum_review_ratings

    respond_with(@complaint_review)
  end

  def edit
  end

  def destroy
    @complaint_review.destroy
    respond_with(@complaint_review)
  end


  private

  def set_complaint_review
    @complaint_review = ComplaintReview.find(params[:id])
  end

  def complaint_review_params
    params.require(:complaint_review).permit(:examination_time, :client_approach, :satisfaction, :complaint_id, :user_id, :comment )
  end
end
