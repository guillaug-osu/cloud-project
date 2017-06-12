class Api::V1::UsersController < Api::V1::ApiController
    
    skip_before_action :verify_jwt_token,   :only => [:create, :authenticate]
    skip_before_action :verify_api_key,     :only => [:create]
    
    def authenticate
        render :json => User.authenticate(params, request)
    end
    
    def index
        render :json => User.index(self.current_user, params)
    end
    
    def show
        render :json => User.show(self.current_user, params)
    end
    
    def create
        render :status => 201, :json => User.register(params)
    end
    
    def update
        render :json => User.update(self.current_user, params)
    end
  
    def destroy
        User.delete(self.current_user, params)
        head :no_content
    end

end