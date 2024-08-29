require 'rails_helper'

RSpec.describe LpsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp)
  end

  describe 'Get #index' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe LpsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp)
  end

  describe 'Get #show' do
    it 'returns a successful response' do
      get :show, params: { id: @lp.id }
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
      get :edit, params: { id: @lp.id }
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe LpsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new Lp with valid parameters' do
      expect do
        post :create, params: { lp: { name: Faker::Name.first_name, description: Faker::Lorem.sentence } }
      end.to change(Lp, :count).by(1)
    end

    it 'redirects to the created lp' do
      post :create, params: { lp: { name: Faker::Name.first_name, description: Faker::Lorem.sentence } }
      expect(response).to redirect_to(Lp.last)
    end

    it 'not create new Lp with invalid parameters' do
      expect do
        post :create, params: { lp: { name: nil, description: nil } }
      end.not_to change(Lp, :count)
    end
  end
end

RSpec.describe LpsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp, name: 'Lucas', description: 'Esta es la descripcion.')
  end

  describe 'PATCH #update' do
    it 'updates the requested lp with valid parameters' do
      patch :update, params: { id: @lp.id, lp: { name: 'Simon', description: 'Nueva descripcion.' } }
      @lp.reload
      expect(@lp.name).to eq('Simon')
      expect(@lp.description).to eq('Nueva descripcion.')
    end

    it 'redirects to the lp' do
      patch :update, params: { id: @lp.id, lp: { name: 'Simon', description: 'Nueva descripcion.' } }
      expect(response).to redirect_to(@lp)
    end

    it 'does not update the lp with invalid parameteres' do
      patch :update, params: { id: @lp.id, lp: { name: nil } }
      @lp.reload
      expect(@lp.name).to eq('Lucas')
    end
  end
end

RSpec.describe LpsController, type: :controller do
  before(:each) do
    @lp = FactoryBot.create(:lp, name: 'Anton', description: 'Esta es la nuvea descripcion.')
  end

  describe 'PATCH #update' do
    it 'deletes the requested lp' do
      expect do
        delete :destroy, params: { id: @lp.id }
      end.to change(Lp, :count).by(-1)
    end
  end
end
