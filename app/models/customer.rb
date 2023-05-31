class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true
end
