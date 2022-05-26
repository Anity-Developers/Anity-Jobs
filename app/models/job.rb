class Job < ApplicationRecord
  belongs_to :company
  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :company, presence: true
  validates :application_url, presence: true
end
