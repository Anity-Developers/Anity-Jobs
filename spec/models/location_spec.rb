require "rails_helper"

RSpec.describe Location, type: :model do
  it { is_expected.to have_many(:jobs) }
  it { is_expected.to have_many(:companies) }

  describe "when name is not present" do
    before { @location = Location.new(name: "") }
    it { is_expected.not_to be_valid }
  end

  describe "when name is not unique" do
    before { @location = Location.create(name: "Location") }
    before { @location2 = Location.new(name: "Location") }
    it { is_expected.not_to be_valid }
  end

  describe "when job in not present " do
    before { @location = Location.create(name: "Location") }
    before { @job = Job.new(location: @location) }
    it { is_expected.not_to be_valid }
  end
end
