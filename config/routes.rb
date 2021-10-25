Rails.application.routes.draw do
  resources :enrollments do
    get :my_student, on: :collection
  end
  
  devise_for :users
  
  resources :courses do
    get :purchased, :pending_review, :created, :unapproved, on: :collection
    member do
      get :analytics
      patch :approve
      patch :unapprove
    end
    resources :lessons do
      put :sort
    end
    resources :enrollments, only: [:new, :create]
  end

  resources :users, only: [:index, :edit, :show, :update]
  root 'static_pages#index'
  get 'static_pages/privacy_policy'
  get 'static_pages/activity'
  get 'static_pages/analytics'

  namespace :charts do
    get 'users_per_day'
    get 'enrollments_per_day'
    get 'course_popularity'
    get 'money_makers'
  end
  # get 'charts/users_per_day'
  # get 'charts/enrollments_per_day'
  # get 'charts/course_popularity'
  # get 'charts/money_makers'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
