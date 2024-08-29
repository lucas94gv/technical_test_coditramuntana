# frozen_string_literal: true

# Controller to manage operations related to artists.
class ArtistsController < ApplicationController
  before_action :find_artist, only: %i[show edit]
  def index
    @artists = Artist.all
  end

  def show; end

  def new
    @artist = Artist.new
  end

  def edit; end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
