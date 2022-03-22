# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_artist, only: :index
  before_action :set_song, only: :show

  def index
    @songs = @artist.songs.ordered
  end

  def search
    @songs = Song.search params[:search]
    render 'index'
  end

  def show; end

  private

  def set_artist
    @artist = Artist.find params[:artist_id]
  end

  def set_song
    @song = Song.find params[:id]
  end
end
