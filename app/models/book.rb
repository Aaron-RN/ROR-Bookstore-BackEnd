# frozen_string_literal: true

# Books Model
class Book < ApplicationRecord
  validates :title, length: { in: 3..30 }, presence: true
  validates :author, length: { in: 3..30 }, presence: true
  validates :genre, length: { minimum: 5 }, presence: true
end
