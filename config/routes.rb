Rails.application.routes.draw do
  root "sections#index"

  resources :sections do
    resources :products
  end

  patch "/sections/:section_id/products/:id/increase", to: "products#increase", as: "section_product_increase"
  patch "/sections/:section_id/products/:id/decrease", to: "products#decrease", as: "section_product_decrease"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
