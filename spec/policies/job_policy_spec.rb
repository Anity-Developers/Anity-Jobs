require 'rails_helper'

RSpec.describe JobPolicy, type: :policy do
   context "when as an admin" do
      subject { JobPolicy.new(create(:user, :admin), create(:job)) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end
  end
