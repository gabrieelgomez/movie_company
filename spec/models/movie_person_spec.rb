require 'rails_helper'

RSpec.describe MoviePerson, type: :model do

  describe 'field validations' do
    it 'validates presence of required fields' do
      should validate_presence_of(:movie_id)
      should validate_presence_of(:person_id)
    end

    it 'associations' do
      should belong_to(:movie)
      should belong_to(:person)
    end
  end
end
