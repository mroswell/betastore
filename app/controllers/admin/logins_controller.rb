class Admin::LoginsController < ApplicationController
  layout 'admin'

  def create
    # if params[:password] == 'secret'
    #   session[:logged_in_email] = params[:email]
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
    # if user.try(:password) == params[:password]

      session[:user_id] = user.id
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Login Failed'
      render 'new'
    end
  end
end
