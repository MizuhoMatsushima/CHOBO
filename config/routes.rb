Rails.application.routes.draw do
  # 利用者用
  # URL /customers/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"

    devise_scope :end_user do
      post 'end_users/guest_sign_in', to: 'guests#guest_sign_in'
    end

    resource :end_users, only: [:edit], path_names: { edit: 'information/edit' } do
      get "/" => "end_users#top"
      get "/my_page" => "end_users#show"
      patch "/information" => "end_users#update"
      get "confirm"
      patch "withdraw"
    end

    resources :account_books, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :deposit_balances, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :source_of_incomes, only: [:index, :edit, :create, :update]
    resources :savings_estinations, only: [:index, :edit, :create, :update]
    resources :tags, only: [:create]
    resources :bop_subjects, only: [:new, :show, :index, :edit, :create, :update, :destroy]
    resources :consultations, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
      collection do
        get "my_index"
        get "search"
      end
    end
    get "favorites/my_index"
  end



  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :consultations, only: [:show, :index, :destroy, :edit, :update] do
      resources :comments, only: [:destroy]
      collection do
        get "search"
        get "ai_search"
      end
    end
    resources :end_users, only: [:show, :edit, :update] do
      collection do
        get "search"
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
