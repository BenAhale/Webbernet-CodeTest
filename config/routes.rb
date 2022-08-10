Rails.application.routes.draw do
  resources :password_resets, only: [:create, :edit, :update, :new]
  mount Resque::Server.new, at: '/resque'

  root 'static#home'

  get 'login', to: 'user_sessions#new', as: 'login'
  resource :user_sessions

  resource :team, only: [:new, :create]

  namespace :public do
    resources :releases, only: [:index, :show], param: :public_id
    resources :subscription, only: [:new, :create]
    resources :pubframe, only: [:index]
    resource :error, only: [:show]
    resources :summary, only: [:show]
  end

  namespace :api do
    resources :projects, only: [:show], param: :public_key do
      resources :releases, only: [:index]
      resources :email_subscriptions, only: [:index, :create, :destroy]
      resources :uref_info, path: 'uref-info', only: [:show]
    end
  end

  resources :public_form, only: [:show, :create]

  resources :users, only: [:index, :new, :create, :destroy]
  resource :api_settings, only: [:show]
  resource :ghhook, only: [:create]
  resource :emailhook, only: [:create]

  resource :dashboard, only: [:show]

  resources :projects, only: [:index, :create, :destroy, :new], param: :public_id do
    get 'inbox'
    resources 'prompt_history', only: [:index]
    get 'releases'

    resources :releases, param: :public_id


    resource :settings, only: [:edit, :update] do
      resource :prompt_invitation_token, only: [:new,:create]
      resources :categories, only: [:index, :new, :create, :destroy]
      resources :subscriptions, only: [:index, :create, :destroy, :new, :edit, :update]
      resources :prompt_subscripts, only: [:index, :new, :destroy]
      resources :github_prompt, only: [:new, :create]

      resources :submission_form_prompt, only: [:new, :create, :edit, :update] do
        resources :form_prompt_emails, only: [:new, :create, :destroy]
      end

      resources :public_form_prompt, only: [:new, :create, :edit, :update]

      resources :email_prompt, only: [:new, :create]
      resource :prompt, only: [:new]
      resources :release_robot_prompt, only: [:new, :create]
      resource :feed, only: [:show, :update]
      resources :project_users, only: [:index, :create, :destroy]
    end

    post 'update_settings'
    post 'send_release'
    resources :release_set, only: [:show] do
      get 'resend'
    end

    resource :prompts, only: [:edit, :update] do
      put 'discard'
      get 'edit_release'
      put 'send_to_inbox'
      post 'create_release'
    end
    post 'hook'
  end
end
