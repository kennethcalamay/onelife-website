OnelifeWebsite::Application.routes.draw do
  get '/about', :to => "pages#about"
  get '/photos', :to => "pages#photos"
  get '/videos', :to => "pages#videos"
  get '/contact_us', :to => "pages#contact_us"
  get '/donate', :to => "pages#donate"

  root :to => "pages#index"
end
