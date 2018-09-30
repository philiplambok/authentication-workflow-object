class DashboardWorkflow 
  attr_reader :error

  def initialize(opts)
    @auth_header = opts[:auth_header]
  end

  def allow? 
    if auth_header_valid? and user
      true
    else 
      set_have_not_permission_error && false
    end
  end

  def user
    TokenService.user(@auth_header.token)
  end

  private
  def auth_header_valid? 
    @auth_header = AuthHeaderService.new(auth_header: @auth_header)
    @auth_header.valid?
  end

  def set_have_not_permission_error
    @error = "Sorry, you don't have permission"
  end
end