class AuthHeaderService
  def initialize(opts)
    @auth_header = opts[:auth_header]
  end

  def valid? 
    if header_not_empty and header_have_valid_format and header_can_decode
      true
    else 
      false
    end 
  end

  def token
    auth_header = @auth_header.split
    auth_header[1]
  end

  private
  def header_not_empty
    !@auth_header.nil?
  end

  def header_have_valid_format 
    auth_header_arr = @auth_header.split
    return false unless auth_header_arr.count == 2
    return false unless auth_header_arr[0] == "Bearer"
    true
  end

  def header_can_decode
    if TokenService.decode(@auth_header.split[1])
      true
    else
      false
    end
  end
end