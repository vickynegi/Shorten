require "application_system_test_case"

class ShrinksTest < ApplicationSystemTestCase
  setup do
    @shrink = shrinks(:one)
  end

  test "visiting the index" do
    visit shrinks_url
    assert_selector "h1", text: "Shrinks"
  end

  test "creating a Shrink" do
    visit shrinks_url
    click_on "New Shrink"

    click_on "Create Shrink"

    assert_text "Shrink was successfully created"
    click_on "Back"
  end

  test "updating a Shrink" do
    visit shrinks_url
    click_on "Edit", match: :first

    click_on "Update Shrink"

    assert_text "Shrink was successfully updated"
    click_on "Back"
  end

  test "destroying a Shrink" do
    visit shrinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shrink was successfully destroyed"
  end
end
