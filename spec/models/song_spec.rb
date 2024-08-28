# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Song, type: :model) do
  before(:each) do
    @song = FactoryBot.create(:song)
  end

  describe 'database kind fields' do
    it 'name is string' do
      expect(@song.name).to be_kind_of(String)
    end

    it 'is valid if lp_id is integer' do
      expect(@song.lp_id).to be_kind_of(Integer)
    end
  end

  describe 'mandatory values' do
    it 'is not valid if name is not present' do
      @song.name = nil
      expect(@song).not_to be_valid
    end

    it 'is not valid if lp_id is not present' do
      @song.lp_id = nil
      expect(@song).not_to be_valid
    end
  end
end
