require 'securerandom'

module User::Actions

    def self.included(klass)
        klass.extend ClassMethods 
    end
    
    def ensure_authentication_token
        if self.authentication_token.blank?
            user.regenerate_authentication_token
        end
    end
  
    def reset_authentication_token
        user.regenerate_authentication_token
    end
    
    module ClassMethods
        
        # retrieves all api_keys
        
        def index(current_user, params)

            # check if user can get an api key
            authorize(current_user)
            
            return User.all
        end
        
        # creates a user
        
        def register(params)
            raise BadRequestException.new "Email is Required" unless params[:email].present?
            raise BadRequestException.new "Password is Required" unless params[:password].present?
            raise BadRequestException.new "Role is Required" unless params[:role].present?
            
            # create the user
            user = User.new(:email => params[:email].downcase, :password => params[:password], :role => params[:role])
            
            # check for a save
            if not user.save
                raise UnprocessableException.new(user)
            else
                # create a key
                key = SecureRandom.uuid.gsub('-', '')
                # create the api key
                ApiKey.create(:key => key, :user_id => user.id)
            end
            return user
        end
        
        # authenticates the user and returns a token
        
        def authenticate(params, request)
            raise BadRequestException.new "Email is Required" unless params[:email].present?
            raise BadRequestException.new "Password is Required" unless params[:password].present?
            
            # find the user by email
            user = User.find_by_email(params[:email])
            raise BadRequestException.new "Invalid Credentials" unless user.present?
            
            # make sure user password is correct
            if not user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
                raise BadRequestException.new "Invalid Credentials"
            end
            
            # get the api key
            api_key = request.headers["CP-ApiKey"]
            
            # make sure the api key passed in matches the user's api key
            if not user.api_key.key === api_key
                raise BadRequestException.new "Invalid Credentials"
            end
            
            # increment sign in count
            user.sign_in_count += 1
            
            # make sure authentication token is set
            user.ensure_authentication_token
            
            # create the token
            token = TokenService.create_jwt(user)
            
            # return the token
            return {token: token}
        end
        
        # retrieves a user
        
        def show(current_user, params)
            raise BadRequestException.new "User ID Required" unless params[:id].present?
            
            if current_user.role === "admin"
                user = find(params[:id])
            else
                # find the user
                user = find(params[:id])
                
                # we need to verify that the current user's email matches the user they're looking for
                if not current_user.email === user.email
                    raise BadRequestException.new "You do not have the correct permissions"
                end
            end
            return user
        end
        
        # edits a user
        
        def update(current_user, params)
            raise BadRequestException.new "User ID Required" unless params[:id].present?
            raise BadRequestException.new "User Required" unless params[:user].present?
            
            # find the user
            user = find(params[:id])
            
            if current_user.role === "admin"
                # update the user
                update_user(user, params)
            else
                # we need to verify that the current user's email matches the user they're looking for
                if not current_user.email === user.email
                    raise BadRequestException.new "You do not have the correct permissions"
                else
                    # update the user
                    update_user(user, params)
                end
            end
            return user
        end
        
        # updates the user's information
        
        def update_user(user, params)
            if not user.update_attributes(params[:user].permit!)
                raise UnprocessableException.new(user)
            end
        end
        
        # deletes a user
        
        def delete(current_user, params)
            raise BadRequestException.new "User ID Required" unless params[:id].present?
            
            # find the user
            user = find(params[:id])
            
            if current_user.role === "admin"
                # update the user
                user.destroy
            else
                # we need to verify that the current user's email matches the user they're looking for
                if not current_user.email === user.email
                    raise BadRequestException.new "You do not have the correct permissions"
                else
                    # delete the user
                    user.destroy
                end
            end
        end
        
        # checks whether is an admin
        
        def authorize(current_user)
            if not current_user.role === "admin"
                raise BadRequestException.new "You do not have the correct permissions"
            end
        end
    
    end
end