# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  before(:each) do
    @artist1 = FactoryBot.create(:artist)
    @artist2 = FactoryBot.create(:artist)
    @artist3 = FactoryBot.create(:artist)
  end

  describe 'Get #index' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'total artists is 3' do
      expect(Artist.all.count).to eq(3)
    end
  end
end

RSpec.describe ArtistsController, type: :controller do
  describe 'Get #show' do
    it 'returns a successful response' do
      get :show, params: { id: @artist1.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: @artist1.id }
      expect(response).to have_http_status(:success)
    end
  end
end
