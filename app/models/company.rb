class Company < ApplicationRecord
  has_rich_text :description
  validates_presence_of :name
end
