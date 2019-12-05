class PDFController < DownloadController

  def initialize(events)
    @events = events
  end

  def event_table_data
    [event_header, *event_rows]
  end

  def event_header
    ["Title", "Category", "Description",	"Organizer Name",	"Organizer Email",	"Organizer Contact No",	"Venue",
     "Address 1",	"Address 2",	"City",	"County",	"Country",	"Start Time",	"End Time"]
  end

  def event_rows
    @events.each.map do |event|
      [event.title, event.category, event.description, event.organizer_name, event.organizer_email, event.organizer_contact_no, event.venue,
       event.address1, event.address2, event.city, event.county, event.country, event.start_time.strftime("%d/%m/%Y %I:%M%p"), event.end_time.strftime("%d/%m/%Y %I:%M%p")]
    end
  end
end
