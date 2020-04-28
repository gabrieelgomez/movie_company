# frozen_string_literal: true

# Api::V1 module
module Api::V1
  # Movies::MoviesController controller
  class MoviesController < ApiController
    include MoviesDoc
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_movie, only: %i[show update destroy]

    # POST v1/movies/create
    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: 422
      end
    end

    # GET v1/movies/:movie_id
    def show
      render json: @movie, status: :ok
    end

    # GET v1/movies
    def index
      @movies = Movie.all.includes(:people).order(id: :asc)
      render json: @movies, status: :ok
    end

    # PUT v1/movies/:movie_id/update
    def update
      if @movie.update(movie_params)
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: 422
      end
    end

    # DELETE v1/movies/:movie_id/destroy
    def destroy
      if @movie.destroy
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: 422
      end
    end

    private

    # Movie params
    def movie_params
      params.require(:movie).permit(
        :title, :release_year,
        casts_attributes: %i[id person_id role_id _destroy]
      )
    end

    # Set movie
    def set_movie
      @movie = Movie.find_by(id: params[:movie_id])
    end
  end
end
