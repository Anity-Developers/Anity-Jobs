class Role < ApplicationRecord
  enum name: {
    admin: 0,
    company: 1,
    user: 2
  }

  validates :name, presence: true, uniqueness: true
end
