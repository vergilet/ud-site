class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy, :load_tile]
  before_filter :authenticate_user!, except: [:show, :index, :load_tile]
  before_filter :check_permissions, except: [:show, :index, :load_tile]

  # GET /series
  # GET /series.json

  def index
    if params[:search]
      @series = Series.search(params[:search])
    else
      @series = Series.all
    end
    @series_presenter = SeriesPresenter.instantiate(@series)
  end

  def load_tile
    @series_presenter = SeriesPresenter.new(@series)
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @episodes = @series.episodes
    @series_presenter = SeriesPresenter.new(@series)
    @episodes_presenter = EpisodePresenter.instantiate(@series.episodes)
  end

  # GET /series/new
  def new
    @series = Series.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /series/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /series
  # POST /series.json
  def create
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    @series = Series.new(series_params)
    @series.category_id = params[:category_id]
    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      @categories = Category.all.map{|c| [ c.name, c.id ] }
      @series.category_id = params[:category_id]
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(
          :name, :description, :cover,
          :episodes_amount,
          :torrent, :episode_time, :year,
          :studio_name, :video_info,
          :audio_info, :translator, :actors,
          :sound_maker, :source_mirror,
          :source_mirror_additional,
          :tag_list,
          :original_name,
          :category_id,
          episodes_attributes: episode_params
      )
    end

    def episode_params
      [:id, :episode_number, :name, :video_link, :_destroy]
    end
end
