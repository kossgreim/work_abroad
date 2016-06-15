class UserService
  def create_user(params)
    user = User.new(params)
    user.password = generate_password
    user.save
  end

  def generate_password(length=8)
    SecureRandom.hex(length)
  end
end
