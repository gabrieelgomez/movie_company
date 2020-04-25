require 'rails_helper'

RSpec.describe PeopleRole, type: :model do

  describe 'validations' do

    it 'validates presence of required fields' do
      should validate_presence_of(:person_id)
      should validate_presence_of(:role_id)
    end

    it 'associations' do
      should belong_to(:person)
      should belong_to(:role)
    end
  end

end
