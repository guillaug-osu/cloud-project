class UnprocessableException < StandardError
  
    attr_reader :resource
    
    def initialize(resource)
        @resource = resource
    end
  
end