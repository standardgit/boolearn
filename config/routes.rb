Rails.application.routes.draw do
  resources :enrollments do
    get :my_student, on: :collection
  end
  resources :lessons
  devise_for :users
  resources :courses do
    get :purchased, :pending_review, :created, on: :collection
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'static_pages#landing_page'
  get 'static_pages/privacy_policy'
  get 'static_pages/activity'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
