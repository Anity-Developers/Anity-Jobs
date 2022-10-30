# frozen_string_literal: true

require 'rails_helper'
require 'support/features/clearance_helpers'

RSpec.describe 'Companies', type: :request do
  include Features::ClearanceHelpers

  # context "when as an admin" do
  #   let!(:user) { create(:user, :admin) }
  #   let!(:location) { create(:location) }
  #   let!(:company) { create(:company, location: location) }

  #   before do
  #     sign_in(FactoryBot.create(:user, :admin))
  #   end

  #   describe "GET /companies" do
  #     it "works! (now write some real specs)" do
  #       get companies_path
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  # end
end
