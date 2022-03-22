# frozen_string_literal: true

class Song < ApplicationRecord
  # Attributes
  attribute :name
  has_one_attached :audio, dependent: :purge

  # Relations
  belongs_to :artist, inverse_of: :songs

  # Scope
  scope :ordered, -> { order(:title) }
  scope :search, ->(query) { joins(:artist).ordered.where('title ILIKE :query OR name ILIKE :query', query: "%#{query}%") }
end
