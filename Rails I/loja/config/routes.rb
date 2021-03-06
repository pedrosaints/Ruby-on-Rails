Rails.application.routes.draw do

  # new product
  # post "produtos", to: "produtos#create"
  # get "produtos/new",to: "produtos#new"

  # delete product
  # delete "produtos/:id/remover", to: "produtos#destroy", as: :produto

  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  resources :produtos, only: [:new, :create, :destroy]

  # root
  root to: "produtos#index"
end
