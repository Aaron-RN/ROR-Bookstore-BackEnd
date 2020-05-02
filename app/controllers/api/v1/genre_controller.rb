# frozen_string_literal: true

module Api
  module V1
    # Genre controller
    class GenreController < ApplicationController
      before_action :set_genre, only: %i[show update destroy]

      def index
        render json: Genre.with_id
      end

      def create
        genre = Genre.new(genre_params)

        if genre.save
          render json: { status: 'SUCCESS', message: 'genre successfully added',
                         data: genre }, status: :ok
        else
          render json: { status: 'ERROR', message: 'genre could not be added',
                         error: genre.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @genre.destroy
        render json: { status: 'SUCCESS', message: 'genre was removed',
                       data: @genre }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_genre
        @genre = Genre.find(params[:id])
      end

      # Never trust parameters from the scary internet,
      # only allow the white list through.
      def genre_params
        params.permit(:name)
      end
    end
  end
end
