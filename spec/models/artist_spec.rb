# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Artist, type: :model) do
  before(:each) do
    @artist = FactoryBot.create(:artist)
  end

  describe 'database kind fields' do
    it 'name is string' do
      expect(@artist.name).to be_kind_of(String)
    end

    it 'description is text' do
      column = ActiveRecord::Base.connection.columns(Artist.table_name).find { |c| c.name == 'description' }
      expect(column.type).to eq(:text)
    end
  end

  describe 'mandatory values' do
    it 'is not valid if name is not present' do
      @artist.name = nil
      expect(@artist).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'should have many lps' do
      artist = described_class.reflect_on_association(:lps)
      expect(artist.macro).to eq(:has_many)
    end
  end
end
