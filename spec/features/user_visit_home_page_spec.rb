# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserVisitHomePage', type: :feature do
  it 'displays the search bar' do
    visit root_path
    expect(page).to have_content('Anity Jobs helps you quickly find a job anywhere in Africa.')
  end

  it 'displays all jobs' do
    3.times do
      create(:job, :published)
    end
    create(:job, :published, title: 'Ruby on Rails')
    visit root_path
    expect(page).to have_content('Jobs')
    expect(page).to have_content('Ruby on Rails')
  end

  it 'displays the button to get in touch' do
    visit root_path
    expect(page).to have_content('Get in touch')
  end

  it 'displays the button to see all jobs' do
    visit root_path
    expect(page).to have_content('All jobs')
  end

  it 'displays the button to redirect to community' do
    visit root_path
    expect(page).to have_content('Community')
  end

  it 'the search bar has an input field' do
    visit root_path
    expect(page).to have_selector('input')
    expect(page).to have_selector("input[type='text']")
    expect(page).to have_selector("input[type='text'][placeholder='Search job by title, location, company...']")
    expect(page).to have_button('Search')
  end

  it 'displays the navbar' do
    visit root_path
    expect(page).to have_content('Anity Jobs')
    expect(page).to have_content('Community')
    expect(page).to have_content('All jobs')
    expect(page).to have_content('Get in touch')
  end
end
