require 'prawn'
require_relative '../../app/controllers/pdf_controller'

class EventsPdf < Prawn::Document
  def initialize(events)
    super(top_margin: 70)
    @events = events

    table (PDFController.new(@events).event_table_data) do
      row(0).font_style = :bold
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end
end
