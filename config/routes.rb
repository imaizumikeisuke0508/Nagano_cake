Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
  patch 'customers/information' => 'customers#update', as: 'update_information'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip:[:registrations, :passwods], controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  resources :orders, only: [:index, :show]
  resources :items, only: [:new, :show, :edit, :index, :create, :update]
  end
end
