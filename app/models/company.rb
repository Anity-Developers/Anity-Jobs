class Company < ApplicationRecord
  has_many :jobs
  has_one :customer
  belongs_to :location
  belongs_to :package
  has_one_attached :logo

  has_rich_text :description
  validates_presence_of :name
  validates_uniqueness_of :name
end
