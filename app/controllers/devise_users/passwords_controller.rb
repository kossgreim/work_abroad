class DeviseUsers::PasswordsController < Devise::PasswordsController
  layout 'login', only: [:new]

  def new
    super
  end
end
