Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/travel/show', to: 'travel#show'
  root :to => "travel#show"
end
