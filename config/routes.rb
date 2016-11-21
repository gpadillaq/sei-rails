Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'sessions'
  }
  resources :users
  resources :surveys
  root to: "surveys#index"

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    resources :users do
      collection do
        post :import
      end
    end
    root to: "/admin/survey_results#index"
    resources :answer_types
    resources :answers
    resources :question_types
    resources :questions
    resources :survey_comments
    resources :survey_results do
      collection do
        get :xlsx
      end
    end
    resources :subjects
    resources :surveys
    resources :intervals
    resources :groups
    resources :levels
    resources :user_types
    resources :user_surveys
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
