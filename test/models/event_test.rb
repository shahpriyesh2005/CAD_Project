require 'test_helper'

class EventTest < ActiveSupport::TestCase
   # test "the truth" do
   #   assert true
   # end

   test "do not save event when any of the mandatory parameter is missing" do
     event = Event.new(title: "TestEvent1")
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when any of the mandatory parameter is missing")
   end

   test "do not save event when organizer email is not in proper format" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail",
                       organizer_contact_no: 1234567890,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: Time.now,
                       end_time: Time.now,
                       publish_time: Time.now,
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when organizer email is not in proper format")
   end

   test "do not save event when organizer contact no is not in proper format" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail.com",
                       organizer_contact_no: 12345,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: Time.now,
                       end_time: Time.now,
                       publish_time: Time.now,
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when organizer contact no is not in proper format")
   end

   test "do not save event when date is missing" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail.com",
                       organizer_contact_no: 1234567890,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       # start_time: Time.now,
                       # end_time: Time.now,
                       # publish_time: Time.now,
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when date is missing")
   end

   test "do not save event when any field data length is less than required" do
     event = Event.new(title: "Test",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail.com",
                       organizer_contact_no: 1234567890,
                       venue: "Test",
                       address1: "Test",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: Time.now,
                       end_time: Time.now,
                       publish_time: Time.now,
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when any field data length is less than required")
   end

   test "do not save event when description data length is less than required" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail.com",
                       organizer_contact_no: 1234567890,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: Time.now,
                       end_time: Time.now,
                       publish_time: Time.now,
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when description data length is less than required")
   end

   test "do not save event when date validation fails" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "abc@gmail.com",
                       organizer_contact_no: 1234567890,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: "30-Nov-2019 00:00:00",
                       end_time: "30-Nov-2019 00:00:00",
                       publish_time: "30-Nov-2019 00:00:00",
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1)
     puts event.attributes
     assert_equal(false, event.save, "saved the event even when date validation fails")
   end

   test "save event" do
     event = Event.new(title: "TestEvent1",
                       category: "Concert",
                       description: "TestEvent1 TestEvent1 TestEvent1",
                       organizer_name: "Priyesh Shah",
                       organizer_email: "shahpriyesh2005@gmail.com",
                       organizer_contact_no: 1234567890,
                       venue: "Stadium",
                       address1: "Dublin 1",
                       address2: "",
                       city: "Dublin",
                       county: "Dublin",
                       country: "Republic of Ireland",
                       start_time: "30-Dec-2019 00:00:00",
                       end_time: "31-Dec-2019 00:00:00",
                       publish_time: "10-Nov-2019 00:00:00",
                       reserved_seating: "Yes",
                       sponsored: "Yes",
                       user_id: 1,
                       created_at: Time.now,
                       updated_at: Time.now,
                       picture: "Misc.jpg",
                       overall_rating: 1.0)
     puts event.attributes
     assert_equal(true, event.save, "did not save the event")
   end
end
