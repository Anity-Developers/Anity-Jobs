class Role < ApplicationRecord
  has_many :users

  PERMISSIONS = {
    "superadmin" => {
      all: {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      }
    },
    "admin" => {
      :company => {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      },
      :job => {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      },
      :dashboard => {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      },
      "manager" => {
        company: {
          index: true,
          show: true,
          create: true,
          update: true
        },
        job: {
          index: true,
          show: true,
          create: true,
          update: true,
          destroy: true
        }
      }
    }
  }

  enum name: {
    user: 0,
    manager: 1,
    admin: 2,
    super_admin: 3
  }

  def has_permission?(action, resource)
    PERMISSIONS.dig(name, resource, action) ||
      PERMISSIONS.dig(name, :all, action)
  end

  validates :name, presence: true, uniqueness: true
end
