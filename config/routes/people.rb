namespace :people do
  get '/', to: 'people#index'
  get '/:person_id', to: 'people#show'
  post '/create', to: 'people#create'
  put '/:person_id/update', to: 'people#update'
  delete '/:person_id/destroy', to: 'people#destroy'
end
