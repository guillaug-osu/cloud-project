class Api::V1::BooksController < Api::V1::ApiController
    
    def index
        render :json => Book.index(self.current_user, params)
    end
    
    def show
        render :json => Book.show(self.current_user, params)
    end
    
    def create
        render :status => 201, :json => Book.create(self.current_user, params)
    end
    
    def update
        render :json => Book.update(self.current_user, params)
    end
    
    def search
        render :json => Book.search(self.current_user, params)
    end
  
    def destroy
        Book.delete(self.current_user, params)
        head :no_content
    end

end