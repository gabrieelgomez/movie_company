# frozen_string_literal: true

# Api::V1 module
module Api::V1
  # Movies::MoviesController controller
  class Movies::MoviesController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_movie, only: %i[show updatedestroy]

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        render json: @movie, status: :created
      else
        render json: @movie.errors, status: 422
      end
    end

    def show
      render json: @movie, status: :ok
    end

    def index
      @movies = Movie.all.includes(:people)
      render json: @movies, status: :ok
    end

    def update
      if @movie.update(movie_params)
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: 422
      end
    end

    def destroy
      if @movie.destroy
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: 422
      end
    end

    private

    def movie_params
      params.require(:movie).permit(
        :title, :release_year, person_ids: []
      )
    end

    def set_movie
      @movie = Movie.find_by(id: params[:movie_id])
    end
  end
end
