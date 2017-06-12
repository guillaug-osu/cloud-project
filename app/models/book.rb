class Book < ActiveRecord::Base
    include Book::Actions
    
    validates_presence_of     :name, :message => "Book name is required"
    validates_length_of       :name, :maximum => 50
    
    validates_presence_of     :author, :message => "Book author is required"
    validates_length_of       :author, :maximum => 50
    
    validates_presence_of     :genre, :message => "Book genre is required"
    validates_length_of       :genre, :maximum => 50
    
    validates_presence_of     :user_id, :message => "Book user is required"
  
    belongs_to  :user
end
