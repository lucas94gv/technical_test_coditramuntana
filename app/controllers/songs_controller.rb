# frozen_string_literal: true

# Controller to manage operations related to songs.
class SongsController < ApplicationController
  before_action :set_lp
  before_action :find_song, only: %i[show edit update destroy set_authors]
  def index
    @songs = Song.all
  end

  def show; end

  def new
    @song = @lp.songs.build
  end

  def create
    @song = @lp.songs.build(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to lp_path(@lp), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to lp_song_url(@lp, @song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy!

    respond_to do |format|
      format.html { redirect_to lp_url(@lp), notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Method set authors for a song
  def set_authors
    author_ids = params[:song][:author_ids].reject(&:empty?).map(&:to_i)

    @song.authors = Author.where(id: author_ids)

    if @song.save
      redirect_to [@lp, @song], notice: 'Authors were successfully updated.'
    else
      render :show
    end
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :lp_id)
  end

  def set_lp
    @lp = Lp.find(params[:lp_id])
  end
end
