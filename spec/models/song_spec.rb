# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Song, type: :model) do
  before(:each) do
    @song = FactoryBot.create(:song)
    @author = FactoryBot.create(:author)
    @author_two = FactoryBot.create(:author)
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

RSpec.describe(Song, type: :model) do
  before(:each) do
    @song = FactoryBot.create(:song)
    @author = FactoryBot.create(:author)
    @author_two = FactoryBot.create(:author)
  end

  describe 'Associations' do
    it 'is valid if belongs to lp' do
      expect(@song.lp).to be_kind_of(Lp)
    end

    it 'should have many authors' do
      @song.authors << @author
      @song.authors << @author_two
      expect(@song.authors).to include(@author, @author_two)
      expect(@song.authors.count).to eq(2)
    end
  end
end
