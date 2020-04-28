# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
  end

  scope module: 'api' do
    namespace :v1 do
      # --- People routes
      draw :people

      # --- Movies routes
      draw :movies

      # --- Roles routes
      draw :roles

      # --- Casts routes
      draw :casts
    end
  end
end
