require 'rails_helper'

RSpec.describe Role, type: :model do

  describe 'validations' do

    it 'validates presence of required fields' do
      should validate_presence_of(:name)
    end

    it 'associations' do
      should has_many(:people_roles)
      should has_many(:people)
    end
  end

end
