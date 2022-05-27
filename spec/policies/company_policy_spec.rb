require 'rails_helper'

RSpec.describe CompanyPolicy , type: :policy do
  context "when as an admin" do
    subject { CompanyPolicy.new(create(:user, :admin), create(:company)) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end
end
