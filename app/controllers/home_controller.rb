# frozen_string_literal: true

# Controller to manage operations related to homepage.
class HomeController < ApplicationController
  def index
    @lps = Lp.includes(:artist, songs: :authors).order(created_at: :desc)
  end
end
