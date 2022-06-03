class Job < ApplicationRecord
  belongs_to :company
  belongs_to :location
  belongs_to :category

  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :company, presence: true
  validates :application_url, presence: true

  enum status: {
    pending: 0,
    published: 1,
    closed: 2,
  }

end
