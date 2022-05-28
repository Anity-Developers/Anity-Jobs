require 'rails_helper'

RSpec.describe Job, type: :model do
 it { is_expected.to belong_to(:company) }
  it { is_expected.to have_rich_text(:description) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:company) }
  it { is_expected.to validate_presence_of(:application_url) }
  it { is_expected.to define_enum_for(:status).with(%i[pending published closed]) }

end
