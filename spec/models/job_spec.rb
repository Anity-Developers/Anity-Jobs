require 'rails_helper'

RSpec.describe Job, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:job)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:job, title: nil)).to_not be_valid
  end

  it 'is invalid without a description' do
    expect(FactoryBot.build(:job, description: nil)).to_not be_valid
  end

  it 'is invalid without a company' do
    expect(FactoryBot.build(:job, company: nil)).to_not be_valid
  end

  it 'invalid without an application_url' do
    expect(FactoryBot.build(:job, application_url: nil)).to_not be_valid
  end

end
