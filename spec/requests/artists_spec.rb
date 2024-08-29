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

    # it 'total artists is 3' do
    #   expect(Artist.all.count).to eq(3)
    # end
  end
end

RSpec.describe ArtistsController, type: :controller do
  # describe 'Get #show' do
  #   it 'returns a successful response' do
  #     get :show, params: { id: @artist1.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'Get #new' do
  #   it 'returns a successful response' do
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'Get #edit' do
  #   it 'returns a successful response' do
  #     get :edit, params: { id: @artist1.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end

RSpec.describe ArtistsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new Artist with valid parameters' do
      expect do
        post :create, params: { artist: { name: Faker::Name.first_name, description: Faker::Lorem.sentence } }
      end.to change(Artist, :count).by(1)
    end

    it 'redirects to the created artist' do
      post :create, params: { artist: { name: Faker::Name.first_name, description: Faker::Lorem.sentence } }
      expect(response).to redirect_to(Artist.last)
    end

    it 'not create new Artist with invalid parameters' do
      expect do
        post :create, params: { artist: { name: nil, description: nil } }
      end.not_to change(Artist, :count)
    end
  end
end

RSpec.describe ArtistsController, type: :controller do
  before(:each) do
    @artist = FactoryBot.create(:artist, name: 'Lucas', description: 'Esta es la descripcion.')
  end

  describe 'PATCH #update' do
    it 'updates the requested artist with valid parameters' do
      patch :update, params: { id: @artist.id, artist: { name: 'Simon', description: 'Nueva descripcion.' } }
      @artist.reload
      expect(@artist.name).to eq('Simon')
      expect(@artist.description).to eq('Nueva descripcion.')
    end

    it 'redirects to the artist' do
      patch :update, params: { id: @artist.id, artist: { name: 'Simon', description: 'Nueva descripcion.' } }
      expect(response).to redirect_to(@artist)
    end

    it 'does not update the artist with invalid parameteres' do
      patch :update, params: { id: @artist.id, artist: { name: nil } }
      @artist.reload
      expect(@artist.name).to eq('Lucas')
    end
  end
end

RSpec.describe ArtistsController, type: :controller do
  before(:each) do
    @artist = FactoryBot.create(:artist, name: 'Anton', description: 'Esta es la nuvea descripcion.')
  end

  describe 'PATCH #update' do
    it 'deletes the requested artist' do
      expect do
        delete :destroy, params: { id: @artist.id }
      end.to change(Artist, :count).by(-1)
    end
  end
end
