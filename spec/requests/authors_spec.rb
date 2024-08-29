# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  before(:each) do
    @author = FactoryBot.create(:author)
  end

  describe 'Get #index' do
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe AuthorsController, type: :controller do
  before(:each) do
    @author = FactoryBot.create(:author)
  end

  describe 'Get #show' do
    it 'returns a successful response' do
      get :show, params: { id: @author.id }
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
      get :edit, params: { id: @author.id }
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe AuthorsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new Author with valid parameters' do
      expect do
        post :create, params: { author: { name: Faker::Name.first_name } }
      end.to change(Author, :count).by(1)
    end

    it 'not create new Author with invalid parameters' do
      expect do
        post :create, params: { author: { name: nil } }
      end.not_to change(Author, :count)
    end
  end
end

RSpec.describe AuthorsController, type: :controller do
  before(:each) do
    @author = FactoryBot.create(:author, name: 'Lucas')
  end

  describe 'PATCH #update' do
    it 'updates the requested author with valid parameters' do
      patch :update, params: { id: @author.id, author: { name: 'Simon' } }
      @author.reload
      expect(@author.name).to eq('Simon')
    end

    it 'does not update the author with invalid parameteres' do
      patch :update, params: { id: @author.id, author: { name: nil } }
      @author.reload
      expect(@author.name).to eq('Lucas')
    end
  end
end

RSpec.describe AuthorsController, type: :controller do
  before(:each) do
    @author = FactoryBot.create(:author, name: 'Anton')
  end

  describe 'PATCH #update' do
    it 'deletes the requested author' do
      expect do
        delete :destroy, params: { id: @author.id }
      end.to change(Author, :count).by(-1)
    end
  end
end
