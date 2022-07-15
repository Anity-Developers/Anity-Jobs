require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:role)).to be_valid
  end

  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
  
end
