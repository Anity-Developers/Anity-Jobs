require "rails_helper"

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_rich_text(:description) }
  it { is_expected.to have_many(:jobs) }
end
