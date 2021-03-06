class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?

  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user = nil
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
