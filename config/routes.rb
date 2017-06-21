Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:controller(/:action(/:id))'
  get 'startrekdeepspacenine/characters', :controller => 'categories', :action => 'show', :id => 6, :as => :st_ds9_chars
  get 'startrekvoyager/episodes', :controller => 'categories', :action => 'show', :id => 2, :as => :st_voy_eps
  get 'startrekdeepspacenine/episodes', :controller => 'categories', :action => 'show', :id => 4, :as => :st_ds9_eps
  get 'startrekthenextgeneration/episodes', :controller => 'categories', :action => 'show', :id => 11, :as => :st_tng_eps
  get 'doctorwho/episodes', :controller => 'categories', :action => 'show', :id => 14, :as => :drw_eps

  get 'startrekvoyager/characters', :controller => 'categories', :action => 'show', :id => 5, :as => :st_voy_chars
  get 'startrekthenextgeneration/characters', :controller => 'categories', :action => 'show', :id => 12, :as => :st_tng_chars
  get 'doctorwho/characters', :controller => 'categories', :action => 'show', :id => 15, :as => :drw_chars
  root 'categories#index'
end
