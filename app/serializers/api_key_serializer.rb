class ApiKeySerializer < ActiveModel::Serializer
    attributes :id, :key, :user_id, :created_at
end
