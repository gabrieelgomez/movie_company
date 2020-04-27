scope :casts do
  get '/', to: 'casts#index'
  get '/:cast_id', to: 'casts#show'
  post '/create', to: 'casts#create'
  post '/destroy', to: 'casts#destroy'
end
