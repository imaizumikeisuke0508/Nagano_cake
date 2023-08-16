Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip:[:registrations, :passwods], controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
   resources :orders, only: [:index, :show]
　end
end
