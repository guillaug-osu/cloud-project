require "bcrypt"

class User < ActiveRecord::Base
    include User::Actions
    
    validates_confirmation_of   :password
    validates_presence_of       :password, :on => :create
    validates_presence_of       :email, :message => "User email is required"
    validates_uniqueness_of     :email
    validates_presence_of       :role, :message => "User role is required"
    
    has_one     :api_key,   :dependent => :destroy
    has_many    :books,     :dependent => :destroy
    has_secure_token :authentication_token
    
    attr_accessor :password
    before_save :encrypt_password
    
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
