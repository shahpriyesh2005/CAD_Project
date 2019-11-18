class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @events = pagy(Event.where("start_time > ? and end_time > ? and publish_time <= ?",
                          Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                          Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                          Time.now.strftime("%Y-%m-%d %H:%M:%S")).order("start_time ASC"),
                          page: params[:page], items: 10)
  end
end
