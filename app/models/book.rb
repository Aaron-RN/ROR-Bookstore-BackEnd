# frozen_string_literal: true

# Books Model
class Book < ApplicationRecord
  validates :title, length: { in: 3..60 }, presence: true
  validates :author, length: { in: 3..40 }, presence: true
  validates :genre, length: { minimum: 4 }, presence: true

  has_many :comments
end
