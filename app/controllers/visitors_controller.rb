require 'will_paginate/array'

class VisitorsController < ApplicationController

  def index
    @series = Series.all_ordered_by_child.to_a.paginate(page: params[:page], per_page: 12)
    @series_presenter = SeriesPresenter.instantiate(@series.reverse)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def comments
    page_error_or_missing unless admin?
  end

  private

  def page_error_or_missing
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
