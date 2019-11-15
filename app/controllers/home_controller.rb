class HomeController < ApplicationController
  def index
    @events = Event.where("start_time > ? and end_time > ? and publish_time <= ?",
                          Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                          Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                          Time.now.strftime("%Y-%m-%d %H:%M:%S")).order("start_time ASC")
  end
end
