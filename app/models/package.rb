class Package < ApplicationRecord
    has_many :companies, dependent: :destroy
    
    enum package_type: {
        basic: 0,
        premium: 1,
        ultimate: 2
    }
end
