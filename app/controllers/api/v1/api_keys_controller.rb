class Api::V1::ApiKeysController < Api::V1::ApiController
    
    def index
        render :json => ApiKey.index(self.current_user, params)
    end
    
    def show
        render :json => ApiKey.show(self.current_user, params)
    end

end