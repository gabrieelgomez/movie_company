require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'field validations' do
    it 'validates presence of required fields' do
      should validate_presence_of(:title)
      should validate_presence_of(:release_year)
    end

    it 'associations' do
      should has_many(:movie_people)
      should has_many(:people)
    end
  end
end
