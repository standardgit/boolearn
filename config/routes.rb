Rails.application.routes.draw do
  resources :enrollments do
    get :my_student, on: :collection
  end
  
  devise_for :users
  resources :courses do
    resources :lessons
    get :purchased, :pending_review, :created, on: :collection
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'static_pages#landing_page'
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
