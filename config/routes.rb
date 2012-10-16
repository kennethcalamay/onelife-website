OnelifeWebsite::Application.routes.draw do
  get '/about', :to => "pages#about"
  get '/photos', :to => "pages#photos"
  get '/videos', :to => "pages#videos"
  get '/contact_us', :to => "contact_forms#new", as: 'contact'
  get '/donate', :to => "pages#donate"

  resources :contact_forms, :only => [:new, :create]

  root :to => "pages#index"
end
