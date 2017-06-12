require 'jwt'

class TokenService
    
    def self.create_jwt_token(payload)
        JWT.encode(payload, JWT_SECRET)
    end
    
    def self.create_jwt(user)
        payload = {
            id: user.id,
            email: user.email,
            user_token: user.authentication_token,
            role: user.role,
            created_at: user.created_at,
            api_key: user.api_key.key
        }
        return create_jwt_token(payload)
    end
  
    def self.verify_jwt_token(token)
        
        begin
            jwt = JWT.decode(token, JWT_SECRET)
        rescue JWT::DecodeError
            raise InvalidUserTokenException
        end
        
        user = User.find_by_authentication_token(jwt[0]["user_token"])
        
        if not user
            raise InvalidUserTokenException
        else
            user
        end
    end
    
    JWT_SECRET = "8be59b53488ccc10fc95"

end