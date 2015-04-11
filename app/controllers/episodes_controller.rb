class EpisodesController < ApplicationController
  before_action :set_series, only: :show

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_series
    @episode = Episode.find(params[:id])
  end

end
