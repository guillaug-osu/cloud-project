class Api::V1::ApiController < CloudProjectController
    include ActionController::Serialization
    
    # verification filters
    before_action :verify_api_key
    before_action :verify_jwt_token
    
    
    rescue_from BadRequestException do |e|
        render :status => 400, :json => { :message => e.message }
    end
    
    rescue_from UnprocessableException do |e|
        render :status => :unprocessable_entity, :json => [e.resource.errors.full_messages.first]
    end
    
    rescue_from ActiveRecord::RecordNotFound do |e|
        render :status => :not_found, :json => { :message => e.message }
    end
    
     # accessors
    attr_accessor :current_user
    
    # for active model serializers
    def default_serializer_options  
        {root: false}  
    end
    
    # verify the JWT token, load the user and abilities
    def verify_jwt_token
        token = request.headers["CP-UserToken"]
        
        if not token
            render :status => 401, :json => {:message => "Invalid User Token"}
            return
        end
        
        begin
            # get the user from the token
            self.current_user = TokenService.verify_jwt_token(token)
        rescue InvalidUserTokenException
            render :status => :unauthorized, :json => {:message => "Invalid User Token"}
        end
    end
  
    # verify there is an api key in the request
    def verify_api_key
        api_key = request.headers["CP-ApiKey"]

        api_key_object = ApiKey.find_by_key(api_key)
        if api_key_object.nil?
            render :status => 403, :json => {:message => "Invalid API Key"}
            return
        end
    end
end