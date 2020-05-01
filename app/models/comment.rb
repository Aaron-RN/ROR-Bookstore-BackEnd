# frozen_string_literal:true

# Comment model
class Comment < ApplicationRecord
  validates :body, length: { in: 3..450 }, presence: true

  belongs_to :book
end
