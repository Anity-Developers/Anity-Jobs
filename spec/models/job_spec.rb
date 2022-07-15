require 'rails_helper'

RSpec.describe Job, type: :model do
 it { is_expected.to belong_to(:company) }
  it { is_expected.to have_rich_text(:description) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:company) }
  it { is_expected.to validate_presence_of(:application_url) }
  it { is_expected.to define_enum_for(:status).with(%i[pending published closed]) }

  describe "when title is not present" do
    before { @job = Job.new(title: "") }
    it { is_expected.not_to be_valid }
  end

  describe "when description is not present" do
    before { @job = Job.new(description: "") }
    it { is_expected.not_to be_valid }
  end

  describe "when company is not present" do
    before { @job = Job.new(company: nil) }
    it { is_expected.not_to be_valid }
  end

  describe "when application_url is not present" do
    before { @job = Job.new(application_url: "") }
    it { is_expected.not_to be_valid }
  end

  describe "when status is not present" do
    before { @job = Job.new(status: nil) }
    it { is_expected.not_to be_valid }
  end

  describe "when application url is not present" do
    before { @job = Job.new(application_url: "") }
    it { is_expected.not_to be_valid }
  end

end
