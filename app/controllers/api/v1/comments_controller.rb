# frozen_string_literal: true

module Api
  module V1
    # comments controller
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]

      def create
        comment = comment.new(comment_params)

        if comment.save
          render json: { status: 'SUCCESS', message: 'comment successfully added',
                         data: comment }, status: :ok
        else
          render json: { status: 'ERROR', message: 'comment could not be added',
                         error: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update_attributes(comment_params)
          render json: { status: 'SUCCESS', message: 'comment updated',
                         data: @comment }, status: :ok
        else
          render json: { status: 'ERROR', message: 'comment could not be updated',
                         error: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy
        render json: { status: 'SUCCESS', message: 'comment was removed',
                       data: @comment }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = comment.find(params[:id])
      end

      # Never trust parameters from the scary internet,
      # only allow the white list through.
      def comment_params
        params.permit(:body)
      end
    end
  end
end
