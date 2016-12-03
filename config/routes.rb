Rails.application.routes.draw do

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
    resources :subjects do
      collection do
        post :import
      end
    end
    resources :surveys do
      get :active
      collection do
        post :import
      end
    end
    resources :intervals
    resources :groups
    resources :levels
    resources :user_types
    resources :user_surveys
  end
  devise_for :users, controllers: {
    sessions: 'sessions'
  }
  root to: "surveys#index"
  resources :users
  resources :surveys
  resources :survey_results do
    collection { post :docente }
  end
end
