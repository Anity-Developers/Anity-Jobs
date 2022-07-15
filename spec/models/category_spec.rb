require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to have_many(:jobs) }
  it { is_expected.to validate_presence_of(:name) }

  describe "when name is not present" do
    before { @category = Category.new(name: "") }
    it { is_expected.not_to be_valid }
  end

  describe "when name is not unique" do
    before { @category = Category.create(name: "Category") }
    before { @category2 = Category.new(name: "Category") }
    it { is_expected.not_to be_valid }
  end

end
