class LoginWorkflow
  attr_reader :error
  
  def initialize(opts)
    @username = opts[:username] 
    @password = opts[:password]
  end

  def set_user
    @user = User.find_by(username: @username)
  end 

  def user_authenticate?
    if set_user and @user.authenticate(@password)
      true
    end
  end


  def allow? 
    if user_authenticate?
      true
    else 
      set_credentials_error && false
    end
  end

  def set_credentials_error 
    @error = "Sorry, you're credentials is invalid"
  end

  def token
    TokenService.encode(user_id: 1) if allow?
  end
end