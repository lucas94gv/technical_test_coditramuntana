# frozen_string_literal: true

# Controller to manage operations related to lps.
class LpsController < ApplicationController
  before_action :find_lp, only: %i[show edit update destroy]
  def index
    @lps = Lp.all
    @lps = @lps.filter_by_artist(params[:artist_id]) if params[:artist_id].present?
    @lps = @lps.order(:name)
  end

  def show; end

  def new
    @lp = Lp.new
  end

  def create
    @lp = Lp.new(lp_params)

    respond_to do |format|
      if @lp.save
        format.html { redirect_to lp_url(@lp), notice: 'Lp was successfully created.' }
        format.json { render :show, status: :created, location: @lp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lp.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @lp.update(lp_params)
        format.html { redirect_to lp_url(@lp), notice: 'Lp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lp.destroy!

    respond_to do |format|
      format.html { redirect_to lps_url, notice: 'Lp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_lp
    @lp = Lp.find(params[:id])
  end

  def lp_params
    params.require(:lp).permit(:name, :description, :artist_id)
  end
end
