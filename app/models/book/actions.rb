module Book::Actions

    def self.included(klass)
        klass.extend ClassMethods 
    end
    
    module ClassMethods
        
        # as an admin retrieves all books
        # as a regular users retrieves the user's books
        
        def index(current_user, params)
            if current_user.role === "admin"
                books = Book.all
            else
                books = current_user.books
            end
            return books
        end

        # retrieves a book
        
        def show(current_user, params)
            # check for ID
            raise BadRequestException.new "Book ID Required" unless params[:id].present?
            
            # get the book
            book = find(params[:id])
            
            # check if an admin
            if current_user.role === "admin"
                return book
            else
                # check if the book belongs to the current user
                if current_user.books.where(:id => book.id).count > 0
                    return book
                else
                    raise BadRequestException.new "You don't have the correct permissions"
                end
            end
            
            return book
        end
        
        # creates a book for the current user
        
        def create(current_user, params)
            raise BadRequestException.new "Name is Required" unless params[:name].present?
            raise BadRequestException.new "Author is Required" unless params[:author].present?
            raise BadRequestException.new "Genre is Required" unless params[:genre].present?
            
            # create the book
            book = Book.new(:name => params[:name], :author => params[:author], :genre => params[:genre], :user_id => current_user.id)
            
            # check for a save
            if not book.save
                raise UnprocessableException.new(book)
            end
            return book
        end
        
        # updates a book for the current user
        
        def update(current_user, params)
            raise BadRequestException.new "Book ID Required" unless params[:id].present?
            
            # get the book
            book = find(params[:id])
            
            # check if an admin
            if current_user.role === "admin"
                update_book(book, params)
            else
                # check if the book belongs to the current user
                if current_user.books.where(:id => book.id).count > 0
                    update_book(book, params)
                else
                    raise BadRequestException.new "You don't have the correct permissions"
                end
            end
            return book
        end
        
        # search google books api for a book
        
        def search(current_user, params)
            require 'googlebooks'
            
            # books array
            books = []
            
            # get the response
            response = GoogleBooks.search(params[:search].downcase, {:count => 2})
            
            # create a hash of important information
            response.each do |book|
                books.push(
                    {
                        :title => book.title,
                        :author => book.authors,
                        :description => book.description
                    }
                )
            end
            
            return books
        end
        
        # creates a book for the current user
        
        def delete(current_user, params)
            raise BadRequestException.new "Book ID Required" unless params[:id].present?
            
            # get the book
            book = find(params[:id])
            
            # check if an admin
            if current_user.role === "admin"
                book.destroy
            else
                # check if the book belongs to the current user
                if current_user.books.where(:id => book.id).count > 0
                    book.destroy
                else
                    raise BadRequestException.new "You don't have the correct permissions"
                end
            end
        end
        
        def update_book(book, params)
            if not book.update_attributes(params[:book].permit!)
                raise UnprocessableException.new(book)
            end
        end
    
    end
end