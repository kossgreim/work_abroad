class FrontendController < ApplicationController
  layout "frontend"
  before_action :redirect_to_dashboard_if_user_singed_in

  def index
  end

  private

  def redirect_to_dashboard_if_user_singed_in
    redirect_to authenticated_root_path if user_signed_in?
  end
end
