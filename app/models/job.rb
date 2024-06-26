class Job < ApplicationRecord
  include AlgoliaSearch
  extend FriendlyId

  belongs_to :author, class_name: "User", foreign_key: "user_id"

  default_scope { where(deleted_at: nil).order(created_at: :desc) }

  friendly_id :title, use: :slugged

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

  enum translation: {
    no_translation: 0,
    en: 1,
    fr: 2
  }

  algoliasearch do
    attributes :title, :location, :category ,:company
  end

  Job.reindex

  def self.published
    where(status: 1)
  end

  def increment_view
    self.views += 1
    self.save
  end
end
