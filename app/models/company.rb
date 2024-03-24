class Company < ApplicationRecord
  has_many :jobs
  belongs_to :location
  belongs_to :admin, class_name: 'User', optional: true

  has_one_attached :logo
  has_rich_text :description
  validates_presence_of :name
  validates_uniqueness_of :name
end
