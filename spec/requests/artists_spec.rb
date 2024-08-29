# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/artists/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/artists/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/artists/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/artists/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
