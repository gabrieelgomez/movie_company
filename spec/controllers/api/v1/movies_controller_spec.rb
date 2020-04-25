require 'rails_helper'

module Api::V1
  # Movies::MoviesController controller
  RSpec.describe Movies::MoviesController, type: :controller do
    describe 'POST movies#create' do

      context 'when create a movie' do

        include_context 'Authenticated User'
        let(:person){ create(:person) }
        let(:movie){ create(:movie) }
        let(:movie_params) do
          {
            'movie': {
              'title': Faker::DcComics.title,
              'release': Faker::Date.in_date_period,
              'person_ids': Person.take(5).map(&:id)
            }
          }
        end

        before do
          post :create, params: movie_params
        end

        it 'responds with status created' do
          expect(response).to have_http_status(:created)
        end

        it 'responds with the object created' do
          expect(response_body(response).dig(:data, :title)).to eq(movie_params.dig(:data, :title))
        end
      end
    end

    describe 'GET #show' do
      context 'should render movies#show template' do
        before do
          create_list(:movie, 1)
          get :show
        end

        it 'returns a ok status' do
          expect(response).to have_http_status(:ok)
        end

        it 'responds with a non empty list' do
          expect(response_body(response)).not_to be_empty
        end
      end
    end

    describe 'GET movies#index' do
      context 'movies list' do
        before do
          create_list(:movie, 10)
          get :index
        end

        it 'returns a ok status' do
          expect(response).to have_http_status(:ok)
        end

        it 'responds with a non empty list' do
          expect(response_body(response)).not_to be_empty
        end
      end
    end

    describe 'PUT movies#update' do

      context 'when updating a movie' do

        include_context 'Authenticated User'
        let(:person) { create(:person) }
        let(:movie)  { create(:movie) }

        let(:movie_params) do
            {
              'title': 'New movie title',
              'release': movie.release,
              'person_ids': movie.person_ids
            }
        end

        before do
          put :update, params: { id: movie.id, movie: movie_params }
        end

        it 'responds with status ok' do
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
  
end