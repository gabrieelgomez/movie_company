scope :movies do
  get '/', to: 'movies#index'
  get '/:movie_id', to: 'movies#show'
  post '/create', to: 'movies#create'
  put '/:movie_id/update', to: 'movies#update'
  delete '/:movie_id/destroy', to: 'movies#destroy'
end
