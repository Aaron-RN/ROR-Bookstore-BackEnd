# frozen_string_literal: true

# Book model
class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @books }
      format.json { render json: @books }
    end
  end

  def show
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @book }
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully added.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update; end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully removed.' }
      format.json { head :no_content }
    end
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
