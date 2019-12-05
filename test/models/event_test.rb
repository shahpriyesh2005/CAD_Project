require 'test_helper'

class EventTest < ActiveSupport::TestCase
   #test "the truth" do
   #  assert true
   #end

   test "do not save event" do
     event1 = Event.new(title: "TestEvent1",
                       category: "category",
                       description: "description",
                       organizer_name: "organizer_name",
                       organizer_email: "organizer_email",
                       organizer_contact_no: "organizer_contact_no",
                       venue: "venue",
                       address1: "address1",
                       address2: "address2",
                       city: "city",
                       county: "county",
                       country: "country",
                       start_time: "start_time",
                       end_time: "end_time",
                       publish_time: "publish_time",
                       reserved_seating: "reserved_seating",
                       sponsored: "sponsored",
                       picture: "picture",
                       overall_rating: "overall_rating",
                       user_id: 1)
     assert_equal(false, event1.save, "saved the event")
   end
end
