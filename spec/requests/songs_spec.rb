# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  before(:each) do
    @song = FactoryBot.create(:song)
  end

  describe 'Get #index' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe SongsController, type: :controller do
  before(:each) do
    @song = FactoryBot.create(:song)
  end

  describe 'Get #show' do
    it 'returns a successful response' do
      get :show, params: { lp_id: @song.lp_id, id: @song.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get #new' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get #edit' do
    it 'returns a successful response' do
      get :edit, params: { lp_id: @song.lp_id, id: @song.id }
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe SongsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp)
  end

  describe 'POST #create' do
    it 'creates a new song with valid parameters' do
      expect do
        post :create,
             params: { lp_id: @lp.id, song: { name: Faker::Name.first_name, lp_id: @lp.id } }
      end.to change(Song, :count).by(1)
    end

    it 'not create new song with invalid parameters' do
      expect do
        post :create, params: { lp_id: @lp.id, song: { name: nil } }
      end.not_to change(Song, :count)
    end
  end
end

RSpec.describe SongsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp)
    @song = FactoryBot.create(:song, name: 'Dont Stop Believing', lp_id: @lp.id)
  end

  describe 'PATCH #update' do
    it 'updates the requested song with valid parameters' do
      patch :update, params: { lp_id: @song.lp_id, id: @song.id, song: { name: 'Woke Up This Morning' } }
      @song.reload
      expect(@song.name).to eq('Woke Up This Morning')
    end

    it 'does not update the lp with invalid parameteres' do
      patch :update, params: { lp_id: @song.lp_id, id: @song.id, song: { name: nil } }
      @song.reload
      expect(@song.name).to eq('Dont Stop Believing')
    end
  end
end

RSpec.describe SongsController, type: :controller do
  before(:each) do
    @song = FactoryBot.create(:song)
  end

  describe 'PATCH #update' do
    it 'deletes the requested song' do
      expect do
        delete :destroy, params: { lp_id: @song.lp_id, id: @song.id }
      end.to change(Song, :count).by(-1)
    end
  end
end
