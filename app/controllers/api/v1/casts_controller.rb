# frozen_string_literal: true

# Api::V1 module
module Api::V1
  # Casts::CastsController controller
  class CastsController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_cast, only: %i[show update destroy]

    # POST v1/casts/create
    def create
      @cast = Cast.new(cast_params)
      if @cast.save
        render json: @cast, include: [:movie], status: :ok
      else
        render json: @cast.errors, status: 422
      end
    end

    # GET v1/casts/:cast_id
    def show
      render json: @cast, include: [:movie], status: :ok
    end

    # GET v1/casts
    def index
      @casts = Cast.all.includes(:person, :role, :movie).order(id: :asc)
      render json: @casts, status: :ok
    end

    # POST v1/casts/destroy
    def destroy
      if @cast.destroy
        render json: @cast, include: [:movie], status: :ok
      else
        render json: @cast.errors, status: 422
      end
    end

    private

    # Cast params
    def cast_params
      params.require(:cast).permit(:person_id, :role_id, :movie_id)
    end

    # Set cast
    def set_cast
      @cast = Cast.find_by(id: params[:cast_id])
    end
  end
end
