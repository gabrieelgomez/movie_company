# frozen_string_literal: true

# Api::V1 module
module Api::V1
  # People::PeopleController controller
  class PeopleController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_person, only: %i[show update destroy]

    # POST v1/persons/create
    def create
      @person = Person.new(person_params)
      if @person.save
        render json: @person, status: :created
      else
        render json: @person.errors, status: 422
      end
    end

    # GET v1/persons/:person_id
    def show
      render json: @person, status: :ok
    end

    # GET v1/persons
    def index
      @persons = Person.all.includes(:roles, :movies)
      render json: @persons, status: :ok
    end

    # PUT v1/persons/:person_id/update
    def update
      if @person.update(person_params)
        render json: @person, status: :ok
      else
        render json: @person.errors, status: 422
      end
    end

    # DELETE v1/persons/:person_id/destroy
    def destroy
      if @person.destroy
        render json: @person, status: :ok
      else
        render json: @person.errors, status: 422
      end
    end

    private

    # Person params
    def person_params
      params.require(:person).permit(
        :first_name, :last_name, :aliases, :genre,
        people_roles_attributes: %i[id role_id]
      )
    end

    # Set person
    def set_person
      @person = Person.find_by(id: params[:person_id])
    end
  end
end
