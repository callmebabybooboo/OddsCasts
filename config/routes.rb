Rails.application.routes.draw do
  # Admin routes for articles
  namespace :admin do
    resources :articles
  end

  # Root path for regular articles
  root "articles#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Other routes for PWA files if needed
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end