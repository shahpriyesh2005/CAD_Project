class EventsImportsController < ApplicationController

  def new
    @events_import = EventsImport.new
  end

  def create
    @events_import = EventsImport.new(params[:events_import])

    if @events_import.save
      redirect_to events_path
    else
      render :new
    end
  end
end
