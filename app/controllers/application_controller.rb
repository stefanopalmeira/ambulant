class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 

  protected 


  def user_not_authorized
    flash[:alert] = "Você não está autorizado a realizar esta ação."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] == "sellers" || params[:controller] == "buyers" || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :bio, :lat, :long, :seller, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :bio, :lat, :long, :seller, :photo])
  end
end
