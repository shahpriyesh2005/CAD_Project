require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do not save user when email is not in proper format" do
    user = User.new(email: "abc@gmail")
    puts user.attributes
    assert_equal(false, user.save, "saved the user even when email is not in proper format")
  end

  test "do not save user when any of the mandatory parameter is missing" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: 1234567890,
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "",
                    interest2: "",
                    interest3: "",
                    interest4: "",
                    interest5: "")
    puts user.attributes
    assert_equal(false, user.save, "saved the user when any of the mandatory parameter is missing")
  end

  test "do not save user when contact no is not in proper format" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: "ABCDE",
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "Concert",
                    interest2: "Conference",
                    interest3: "Seminar",
                    interest4: "Fair",
                    interest5: "Food and Drinks")
    puts user.attributes
    assert_equal(false, user.save, "saved the user when contact no is not in proper format")
  end

  test "do not save user when any field data length is less than required" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: 12345,
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "Concert",
                    interest2: "Conference",
                    interest3: "Seminar",
                    interest4: "Fair",
                    interest5: "Food and Drinks")
    puts user.attributes
    assert_equal(false, user.save, "saved the user when any field data length is less than required")
  end

  test "do not save user when interest is missing" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: 1234567890,
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "",
                    interest2: "",
                    interest3: "",
                    interest4: "",
                    interest5: "")
    puts user.attributes
    assert_equal(false, user.save, "saved the user when interest is missing")
  end

  test "do not save user when interest are same" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: 1234567890,
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "Concert",
                    interest2: "Concert",
                    interest3: "Seminar",
                    interest4: "Fair",
                    interest5: "Food and Drinks")
    puts user.attributes
    assert_equal(false, user.save, "saved the user when interest are same")
  end

  test "save user" do
    user = User.new(first_name: "Priyesh",
                    last_name: "Shah",
                    gender: "Male",
                    email: "abc@gmail.com",
                    contact_no: 1234567890,
                    address1: "Dublin 7",
                    address2: "",
                    city: "Dublin",
                    county: "Dublin",
                    country: "Republic of Ireland",
                    interest1: "Concert",
                    interest2: "Conference",
                    interest3: "Seminar",
                    interest4: "Fair",
                    interest5: "Food and Drinks")
    puts user.attributes
    assert_equal(true, user.save, "did not save the user")
  end
end
