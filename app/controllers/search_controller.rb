class SearchController < ApplicationController
  include Pagy::Backend


  def index
    @events = Event.all
    @pagy, @events = pagy(@events, page: params[:page], items: 10)
  end

  def show
    unless params[:event].nil?
      @eventname = params[:event][:"search"]
      @organizername = params[:event][:"organizer"]
      unless params[:event][:"startdate(1i)"] == "" || params[:event][:"startdate(2i)"] == "" || params[:event][:"startdate(3i)"] == ""
        @startdate = Date.civil(params[:event][:"startdate(1i)"].to_i,params[:event][:"startdate(2i)"].to_i,params[:event][:"startdate(3i)"].to_i).strftime("%F")
      end
      unless params[:event][:"enddate(1i)"] == "" || params[:event][:"enddate(2i)"] == "" || params[:event][:"enddate(3i)"] == ""
        @enddate = Date.civil(params[:event][:"enddate(1i)"].to_i,params[:event][:"enddate(2i)"].to_i,params[:event][:"enddate(3i)"].to_i).strftime("%F")
      end
    end

    if @eventname.nil? && @startdate.nil? && @enddate.nil? && @organizername.nil? 
      puts "Empty"
      @events = params["events"]
    else
      puts "Present"
      @events = Event.where("upper(title) like upper(?) AND upper(organizer_name) like upper(?)","%#{@eventname}%","%#{@organizername}%")
      puts "Start: #{@startdate}"
      puts "End: #{@enddate}"
      if !@startdate.nil?
        @events = @events.where(" ? <= start_time ","#{@startdate}")
      end
      if !@enddate.nil?
        @events = @events.where(" ? >= end_time ","#{@enddate}")
      end
      @events = @events.as_json
      redirect_to search_show_path(:events => @events)

    end
    #@pagy, @events = pagy(@events, page: params[:page], items: 10)
  end
end
