class BookSerializer < ActiveModel::Serializer
    attributes :id, :name, :author, :genre, :user_id, :created_at
end
