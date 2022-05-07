class Role < ApplicationRecord
  has_many :users

  enum name: {
    user: 0,
    manager: 1,
    admin: 2,
    super_admin: 3
  }

  validates :name, presence: true
end
