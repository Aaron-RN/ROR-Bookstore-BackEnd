# frozen_string_literal: true

# Books Model
class Book < ApplicationRecord
  validates :title, length: { in: 3..60 }, presence: true
  validates :author, length: { in: 3..40 }, presence: true
  validates :genre, length: { minimum: 4 }, presence: true

  has_many :comments

  def self.with_comments
    books = all
    books_and_comments = []
    books.each do |b|
      book_with_comment = { title: b.title, author: b.author,
                            genre: b.genre, comments: b.comments }
      books_and_comments << book_with_comment
    end

    books_and_comments
  end
end
