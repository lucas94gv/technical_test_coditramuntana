# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Author, type: :model) do
  before(:each) do
    @author = FactoryBot.create(:author)
    @song = FactoryBot.create(:song)
    @song_two = FactoryBot.create(:song)
  end

  describe 'database kind fields' do
    it 'name is string' do
      expect(@author.name).to be_kind_of(String)
    end
  end

  describe 'mandatory values' do
    it 'is not valid if name is not present' do
      @author.name = nil
      expect(@author).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'should have many songs' do
      @author.songs << @song
      @author.songs << @song_two
      expect(@author.songs).to include(@song, @song_two)
      expect(@author.songs.count).to eq(2)
    end
  end
end
