class ExpensesController < ApplicationController
  def index
  	if (params[:category_id].present? || params[:concept].present?)
  		if (params[:category_id].present? && params[:concept].present?)
  			@expenses = Expense.where("category_id = ? AND concept like ?", params[:category_id], "%#{params[:concept]}%")
  		elsif (params[:category_id].present?)
  			@expenses = Expense.where("category_id = ?", params[:category_id])
  		else
  			@expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%")
  		end
  	else
  		@expenses = Expense.order("date DESC")
  	end
  end
end
