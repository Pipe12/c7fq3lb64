class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def after_sign_out_path_for(resource_or_scope)
    redirect_to root_path
  end
  def index
    @user = current_user
    @expenses = {}
    if user_signed_in?
      @expenses = Expense.where(user_id:[current_user.id]).order("date DESC")
    end
  	if (params[:category_id].present?)
  		@expenses = Expense.where("category_id = ?", params[:category_id])
    end
		if (params[:concept].present?) 
  		@expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%")
  	end
  end
end