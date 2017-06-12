class ApiKey < ActiveRecord::Base
    include ApiKey::Actions
        
    validates_uniqueness_of     :key
    validates_presence_of       :user_id, :message => "Api Key user is required"
    
    belongs_to  :user
end
