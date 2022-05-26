require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:role)).to be_valid
  end
  
end
