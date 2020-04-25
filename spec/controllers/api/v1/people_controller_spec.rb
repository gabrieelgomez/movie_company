require 'rails_helper'

module Api::V1
  # Peole::PeoleController controller
  RSpec.describe Peole::PeoleController, type: :controller do
    describe 'POST people#create' do

      context 'when create a person' do

        include_context 'Authenticated User'
        let(:person_params) do
          {
            'person': {
              'first_name': Faker::DcComics.name,
              'last_name': Faker::Name.last_name,
              'aliases': Faker::Internet.username,
              'role_ids': Role.take(2).map(&:id)
            }
          }
        end

        before do
          post :create, params: person_params
        end

        it 'responds with status created' do
          expect(response).to have_http_status(:created)
        end

        it 'responds with the object created' do
          expect(response_body(response).dig(:data, :title)).to eq(person_params.dig(:data, :title))
        end
      end
    end
    
    describe 'GET #show' do
      context 'should render people#show template' do
        before do
          create_list(:person, 1)
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

    describe 'GET people#index' do
      context 'people list' do
        before do
          create_list(:person, 10)
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

    describe 'PUT people#update' do

      context 'when updating a person' do

        include_context 'Authenticated User'
        let(:person) { create(:person) }

        let(:person_params) do
          {
            'person': {
              'first_name': Faker::DcComics.name,
              'last_name': Faker::Name.last_name,
              'aliases': Faker::Internet.username,
              'role_ids': Role.take(2).map(&:id)
            }
          }
        end

        before do
          put :update, params: {id: person.id, person: person_params}
        end

        it 'responds with ok status' do
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
  
end