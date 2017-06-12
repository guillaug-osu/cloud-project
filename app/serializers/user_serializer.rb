class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :role, :sign_in_count, :created_at, :api_key
    
    def api_key
        return nil unless object.api_key.present?
        return object.api_key.key
    end
end
