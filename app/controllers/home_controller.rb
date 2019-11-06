class HomeController < ApplicationController
  def index
    @events = Event.all.order("id ASC")
  end
end
