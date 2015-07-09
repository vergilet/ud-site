require 'will_paginate/array'
class VisitorsController < ApplicationController

  def index
    @series = Series.paginate(page: params[:page], per_page: 12).order('created_at DESC')
    @series_presenter = SeriesPresenter.instantiate(@series)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
