class LoginsController < ApplicationController

  def create
    # if params[:password] == 'secret'
    #   session[:logged_in_email] = params[:email]
    customer = Customer.find_by(email: params[:email])
    if customer.try(:authenticate, params[:password])
    # if user.try(:password) == params[:password]
      session[:customer_id] = customer.id
      redirect_to root_path
    else
      flash.now[:danger] = 'Login Failed'
      render 'new'
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to :back
  end

end
