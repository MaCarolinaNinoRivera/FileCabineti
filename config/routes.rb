Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # Convierte la ruta creada en la principal por defecto si no esta logeado
  authenticated :user do
    root "docs#index", as: "authenticated_root"
  end
    
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Ruta a documentos 
  resources :docs
end
