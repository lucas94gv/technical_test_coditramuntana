# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Lp, type: :model) do
  before(:each) do
    @lp = FactoryBot.create(:lp)
  end

  describe 'database kind fields' do
    it 'name is string' do
      expect(@lp.name).to be_kind_of(String)
    end

    it 'description is text' do
      expect(@lp.description.type).to eq(:text)
    end

    it 'is valid if artist_id is integer' do
      expect(@lp.artist_id).to be_kind_of(Integer)
    end
  end

  describe 'mandatory values' do
    it 'is not valid if name is not present' do
      @lp.name = nil
      expect(@lp).not_to be_valid
    end

    it 'is not valid if name is not present' do
      @lp.artist_id = nil
      expect(@lp).not_to be_valid
    end
  end
end
