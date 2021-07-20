Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", {:controller => "application", :action => "home"})
  get("/forex", {:controller => "forex", :action => "list_from"})
  get("/forex/:from_curr", {:controller => "forex", :action => "list_to"})
  get("/forex/:from_curr/:to_curr", {:controller => "forex", :action => "convert"})
end
