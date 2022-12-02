require 'rails_helper'

RSpec.describe 'SortJobsAccordingToUserLocation', type: :feature do
  it "shows jobs in the user's location fist" do
    location_1 = create(:location, name: "Rwanda🇷🇼")
    location_2 = create(:location, name: "Uganda🇺🇬")

    job_1 = create(:job, :published, location: location_1)
    job_2 = create(:job, :published, location: location_2)

    visit root_path

    expect(page).to have_content(job_1.title)
  end
end