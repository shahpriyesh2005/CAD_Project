require 'log'

class EventsImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_events
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(5)

    (6..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      event = Event.find_by_id(row["id"]) || Event.new
      event.attributes = row.to_hash
      event
    end
  end

  def imported_events
    @imported_events ||= load_imported_events
  end

  def save
    imported_events.each_with_index do |event, index|
      Log.debug("Inside loop")
      puts "Inside loop"

      if Event.exists?(event["id"])
        Log.debug("user_id 1 : " + event["user_id"].to_s)
        puts "user_id 1 : " + event["user_id"].to_s
        Log.debug("user_id 2 : " + Event.find(event["id"])["user_id"].to_s)
        puts "user_id 2 : " + Event.find(event["id"])["user_id"].to_s

        if event["user_id"] != Event.find(event["id"])["user_id"]
          Log.debug("Inside if 2")
          puts "Inside if 2"
          errors.add :base, "Row #{index + 6}: you are not authorized to modify the event"
          return
        end
      end
    end

    if imported_events.map(&:valid?).all?
      imported_events.each(&:save!)
      true
    else
      imported_events.each_with_index do |event, index|
        event.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
  end

end
