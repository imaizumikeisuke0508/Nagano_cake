Rails.application.routes.draw do
  get 'homes/top'
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
resources :orders, only: [:index, :show]
end
