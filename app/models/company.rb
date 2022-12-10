class Company < ApplicationRecord
  has_many :jobs
  belongs_to :location
  has_one_attached :logo

  has_rich_text :description
  validates_presence_of :name
  validates_uniqueness_of :name
end
