class DownloadController < ApplicationController
  helper_method :event_table_data

  def event_table_data
    raise NotImplementedError
  end

  def event_header
    raise NotImplementedError
  end

  def event_rows
    raise NotImplementedError
  end
end
