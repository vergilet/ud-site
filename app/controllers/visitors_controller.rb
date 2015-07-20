require 'will_paginate/array'

class VisitorsController < ApplicationController

  def index
    @series = Series.all_ordered_by_child.to_a.paginate(page: params[:page], per_page: 9)
    @series_presenter = SeriesPresenter.instantiate(@series)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
