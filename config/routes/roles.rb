scope :roles do
  get '/', to: 'roles#index'
  get '/:role_id', to: 'roles#show'
end
