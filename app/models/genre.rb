# frozen_string_literal: true

# Genre Model
class Genre < ApplicationRecord
  validates :name, length: { in: 3..30 }, presence: true


  def self.with_id
    genres = all
    genres_with_ids = []
    genres.each do |g|
      genre_and_id = { id: g.id, name: g.title }
      genres_with_ids << genre_and_id
    end

    genres_with_ids
  end
end
