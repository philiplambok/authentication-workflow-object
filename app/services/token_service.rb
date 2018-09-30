class TokenService 
  def self.encode(payload)
    JWT.encode(payload, nil, 'none')
  end

  def self.decode(token)
    begin
      JWT.decode(token, nil, false)
    rescue
      nil
    end
  end

  def self.user(token)
    decoded = decode(token)
    user_id = decoded[0]["user_id"] if decoded
    User.find_by(id: user_id)
  end
end