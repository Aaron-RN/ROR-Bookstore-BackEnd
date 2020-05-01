# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get '/books/:id/comments', to: 'books#show_comments'
      resources :books do
        resources :comments, only: %i[create update destroy]
      end
      resources :genre, only: %i[index create destroy]
    end
  end
  root 'api/v1/books#index'
end
