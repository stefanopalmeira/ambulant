class PagesController < ApplicationController
  before_action :dispatch_user
  def home

  end

  private

  def dispatch_user
    return unless current_user && request.get?
    path = sellers_path if request.path == root_path && current_user.seller
    path = buyers_path if request.path == root_path && !current_user.seller
    redirect_to path unless path.nil? || path == request.path
  end

end
