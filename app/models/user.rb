class User < ApplicationRecord
  include Clearance::User

  belongs_to :role

  after_initialize :set_default_role

  def admin?
    self.role.name == 'admin'
  end

  private
  def set_default_role
    self.role = Role.find_or_create_by(name: 'user')
  end
end
