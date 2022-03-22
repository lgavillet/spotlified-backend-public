# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :set_artist, only: :show

  def index
    @artists = Artist.ordered
  end

  def show; end

  private

  def set_artist
    @artist = Artist.find params[:id]
  end
end
