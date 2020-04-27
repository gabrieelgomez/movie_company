# frozen_string_literal: true

# Api::V1 module
module Api::V1
  # Roles::RolesController controller
  class RolesController < ApiController
    before_action :set_role, only: %i[show update destroy]

    # GET v1/roles/:role_id
    def show
      render json: @role, status: :ok
    end

    # GET v1/roles
    def index
      @roles = Role.all.includes(:people, :movies)
      render json: @roles, status: :ok
    end

    private

    # Set role
    def set_role
      @role = Role.find_by(id: params[:role_id])
    end
  end
end
