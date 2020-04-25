require 'rails_helper'

RSpec.describe Person, type: :model do

  describe 'validations' do

    it 'validates presence of required fields' do
      should validate_presence_of(:first_name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:aliases)
    end

    it 'associations' do
      should has_many(:people_roles)
      should has_many(:roles)
      should has_many(:movies_people)
      should has_many(:movies)
    end
  end

end
