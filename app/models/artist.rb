# frozen_string_literal: true

class Artist < ApplicationRecord
  # Attributes
  attribute :name
  has_one_attached :image, dependent: :purge do |attachable|
    attachable.variant :thumbnail, resize_to_limit: [300, 300]
  end

  # Relations
  has_many :songs, -> { ordered }, inverse_of: :artist, dependent: :destroy

  # Scopes
  scope :ordered, -> { order(:name) }
end
