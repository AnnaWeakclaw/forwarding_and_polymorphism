class AuthUser
  def initialize(name, bio, age, password)
    @user = User.new(name, bio, age)
    @password = password
  end

  def authenticate(candidate_password)
    return @user.profile if candidate_password == @password
    false
  end
end
