module ApiKey::Actions

    def self.included(klass)
        klass.extend ClassMethods 
    end
    
    module ClassMethods
        
        # retrieves all api_keys
        
        def index(current_user, params)

            # check if user can get an api key
            authorize(current_user)
            
            return ApiKey.all
        end

        # retrieves an api_key
        
        def show(current_user, params)
            # check for ID
            raise BadRequestException.new "ApiKey ID Required" unless params[:id].present?
            
            # check if user can get an api key
            authorize(current_user)
            
            # get the api key
            api_key = find(params[:id])
            
            return api_key
        end
        
        # checks whether is an admin
        
        def authorize(current_user)
            if not current_user.role === "admin"
                raise BadRequestException.new "You do not have the correct permissions"
            end
        end
    
    end
end