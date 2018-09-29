class TokenService 
  def self.encode(payload)
    JWT.encode(payload, nil, 'none')
  end
end