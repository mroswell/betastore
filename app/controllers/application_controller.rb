class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger




# "protected" enables you to call the method in sub-classes.
protected
  helper_method def logged_in?
    session[:customer_id].present?
  end

  helper_method :current_customer
  def current_customer
    if logged_in?
     @current_customer ||= Customer.find(session[:customer_id])
    end
  end

  def set_current_customer(customer=nil)
    session[:customer_id] = customer.try(:id)
  end
end
