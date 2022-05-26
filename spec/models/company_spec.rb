require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:company)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryBot.build(:company, name: nil)).to_not be_valid
  end

  it 'it has many jobs' do
    expect(FactoryBot.build(:company)).to respond_to(:jobs)
  end
  
end
