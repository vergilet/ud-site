class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin?
  helper_method :user_signed_in?
  helper_method :correct_user?

  before_filter :reset_headers
#   before_filter :redirect_to_http
  before_filter :change_sub_domain
  
  def reset_headers
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end

  def redirect_to_http
    redirect_to :protocol => "http://" if request.protocol == 'https://'
  end
  
  def change_sub_domain
    if request.subdomain == ''
      redirect_to request.url.sub('', 'www')
    end
  end

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

    def check_permissions
      redirect_to root_url, :alert => "Access denied." unless admin?
    end

    def admin?
      [3, 6, 5, 7, 9, 36].include? current_user.id if current_user.present?
    end

end
