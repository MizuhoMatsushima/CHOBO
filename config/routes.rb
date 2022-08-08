Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/guests#guest_sign_in'
  end

  scope module: :public do
        root to: "homes#top"

    resource :end_users, only: [:edit], path_names: { edit: 'information/edit' } do
      get "/" => "end_users#top"
      get "/my_page" => "end_users#show"
      patch "/information" => "end_users#update"
      get "confirm"
      patch "withdraw"
      get "search"
    end

    resources :account_books, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :bop_subjects, only: [:new, :show, :index, :edit, :create, :update, :destroy]
    resources :subjects, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :tags, only: [:create]
    resources :bop_details, only: [:index, :create, :update] do
      collection do
        get "search"
      end
    end
    resources :details, only: [:index, :edit, :create, :update, :destroy] do
      collection do
        get "search"
      end
    end
    resources :consultations, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
      collection do
        get "my_index"
      end
    end
  end



  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :consultations, only: [:show, :index, :destroy] do
      collection do
        get "search"
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
