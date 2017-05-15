class Slip < ActiveRecord::Base
    validates :number, uniqueness: true
end
