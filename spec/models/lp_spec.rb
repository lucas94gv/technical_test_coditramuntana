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
      column = ActiveRecord::Base.connection.columns(Lp.table_name).find { |c| c.name == 'description' }
      expect(column.type).to eq(:text)
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

  describe 'Associations' do
    it 'is valid if belongs to artist' do
        expect(@lp.artist).to be_kind_of(Artist)
    end

    it 'should have many songs' do
      lp = described_class.reflect_on_association(:songs)
      expect(lp.macro).to eq(:has_many)
    end
  end
end
