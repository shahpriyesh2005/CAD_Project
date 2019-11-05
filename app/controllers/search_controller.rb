class SearchController < ApplicationController
  def index
    @events = Event.all
    puts @events
  end

  def show
    unless params[:event].nil?
      @eventname = params[:event][:"search"]
      @organizername = params[:event][:"organizer"]
      unless params[:event][:"startdate(1i)"] == ""
        @startdate = Date.civil(params[:event][:"startdate(1i)"].to_i,params[:event][:"startdate(2i)"].to_i,params[:event][:"startdate(3i)"].to_i)  
      end
      unless params[:event][:"enddate(1i)"] == ""
        @enddate = Date.civil(params[:event][:"enddate(1i)"].to_i,params[:event][:"enddate(2i)"].to_i,params[:event][:"enddate(3i)"].to_i)
      end
    end

    if @eventname.nil? && @startdate.nil? && @enddate.nil? && @organizername.nil? 
      puts "Empty"
      @events = params[:events]
    else
      puts "Present"
      if !@organizername.nil? || !@eventname.nil?
        @events = Event.where("upper(title) like upper(?) AND upper(organizer_name) like upper(?)","%#{@eventname}%","%#{@organizername}%")
        @events = @events.as_json
        redirect_to search_show_path(:events => @events)
      end
      

    end
    
  end
end
