require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address1", with: @user.address1
    fill_in "Address2", with: @user.address2
    fill_in "City", with: @user.city
    fill_in "Contact no", with: @user.contact_no
    fill_in "Country", with: @user.country
    fill_in "County", with: @user.county
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender
    fill_in "Interest1", with: @user.interest1
    fill_in "Interest2", with: @user.interest2
    fill_in "Interest3", with: @user.interest3
    fill_in "Interest4", with: @user.interest4
    fill_in "Interest5", with: @user.interest5
    fill_in "Last name", with: @user.last_name
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @user.address1
    fill_in "Address2", with: @user.address2
    fill_in "City", with: @user.city
    fill_in "Contact no", with: @user.contact_no
    fill_in "Country", with: @user.country
    fill_in "County", with: @user.county
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender
    fill_in "Interest1", with: @user.interest1
    fill_in "Interest2", with: @user.interest2
    fill_in "Interest3", with: @user.interest3
    fill_in "Interest4", with: @user.interest4
    fill_in "Interest5", with: @user.interest5
    fill_in "Last name", with: @user.last_name
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
