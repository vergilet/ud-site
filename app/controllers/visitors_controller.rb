class VisitorsController < ApplicationController

  def index
    @series = Series.last(12)
    @series_presenter = SeriesPresenter.instantiate(@series)
  end
end
