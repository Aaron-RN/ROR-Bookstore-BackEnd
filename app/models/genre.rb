# frozen_string_literal: true

# Genre Model
class Genre < ApplicationRecord
  validates :name, length: { in: 3..30 }, presence: true
end
