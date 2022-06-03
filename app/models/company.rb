class Company < ApplicationRecord
  has_many :jobs
  belongs_to :location

  has_rich_text :description
  validates_presence_of :name
end
