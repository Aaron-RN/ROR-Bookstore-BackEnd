# frozen_string_literal: true

module Api
  module V1
    # Book model
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show edit update destroy]

      def index
        @books = Book.all
        render json: Book.all
        # respond_to do |format|
        #   format.html # index.html.erb
        #   format.xml  { render xml: @books }
        #   format.json { render json: @books }
        # end
      end

      def show
        if @book
          render json: @book
        else
          render json: @book.errors
        end
      end

      def new
        @book = Book.new
      end

      def create
        @book = Book.new(book_params)

        if @book.save
          render json: @book
        else
          render json: @book.errors
        end
      end

      def edit; end

      def update; end

      def destroy
        @book.destroy
        render json: { message: 'Book was successfully removed' }
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def book_params
        params.require(:book).permit(:title, :author, :genre)
      end
    end
  end
end
