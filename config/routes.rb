Rails.application.routes.draw do
  get 'welcome/index'
  # Convierte la ruta creada en la principal por defecto
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Ruta a documentos 
  resources :docs
end
