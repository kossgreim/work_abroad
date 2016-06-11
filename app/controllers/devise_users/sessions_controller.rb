class DeviseUsers::SessionsController < Devise::SessionsController
  layout 'login', only: [:new]

  def new
    super
  end

  private

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
