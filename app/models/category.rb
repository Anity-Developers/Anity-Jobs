class Category < ApplicationRecord
  has_many :jobs

  validates :name, presence: true, uniqueness: true
end
