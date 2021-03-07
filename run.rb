require 'openssl'
require 'jwt'  # https://rubygems.org/gems/jwt

# Private key contents
private_pem = File.read("./custom-eyes.2021-03-05.private-key.pem")
private_key = OpenSSL::PKey::RSA.new(private_pem)

# Generate the JWT
payload = {
  # issued at time
  iat: Time.now.to_i,
  # JWT expiration time (10 minute maximum)
  exp: Time.now.to_i + (10 * 60),
  # GitHub App's identifier
  iss: "103451"
}

jwt = JWT.encode(payload, private_key, "RS256")
puts jwt