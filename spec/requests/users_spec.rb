# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  describe 'GET /users' do
    # it 'works! (now write some real specs)' do
    #   get users_path
    #   expect(response).to have_http_status(200)
    # end
  end
end
