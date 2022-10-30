# frozen_string_literal: true

require 'rails_helper'
require 'support/features/clearance_helpers'

RSpec.feature 'User creates a company' do
  context 'as a non-admin user' do
    scenario 'they cannot create a company' do
      user = create(:user)
      sign_in(user)

      visit new_company_path

      expect(current_path).to eq root_path
      expect(page).to have_content 'You are not authorized to perform this action.'
    end
  end

  # context "as an admin user" do
  #   scenario "they can create a company" do
  #     user = create(:user, :admin)
  #     sign_in(user)

  #     visit new_company_path

  #     expect(current_path).to eq new_company_path
  #     expect(page).to have_content "Create Company"

  #     fill_in "Name", with: "Acme"
  #     fill_in "Description", with: "A company"
  #     click_on "Create Company"

  #     expect(current_path).to eq company_path(Company.last)
  #     expect(page).to have_content "Acme"
  #     expect(page).to have_content "A company"

  #     expect(page).to have_content "Company was successfully created."
  #   end
  # end
end
