class SongsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  respond_to :html, :xml, :json

  # GET /songs
  # GET /songs.json
  def index
    (params[:search] != '') ? @songs = Song.search(params[:search]).order('page ASC') : @songs = Song.order(page: :asc)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.includes(:writer).find(params[:id])
    ::NewRelic::Agent.add_custom_parameters({ song_id: @song.id, song_title: @song.title })
    # ::NewRelic::Agent.add_custom_parameters({ song_title: @song.title })
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_params
    params.require(:song).permit(:title, :text, :page)
  end

  private
  def sort_column
    params[:sort] || "page"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
