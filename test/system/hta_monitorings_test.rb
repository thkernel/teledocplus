require "application_system_test_case"

class HtaMonitoringsTest < ApplicationSystemTestCase
  setup do
    @hta_monitoring = hta_monitorings(:one)
  end

  test "visiting the index" do
    visit hta_monitorings_url
    assert_selector "h1", text: "Hta Monitorings"
  end

  test "creating a Hta monitoring" do
    visit hta_monitorings_url
    click_on "New Hta Monitoring"

    fill_in "Comments", with: @hta_monitoring.comments
    fill_in "Patient", with: @hta_monitoring.patient_id
    fill_in "Status", with: @hta_monitoring.status
    fill_in "Tad", with: @hta_monitoring.tad
    fill_in "Tas", with: @hta_monitoring.tas
    fill_in "User", with: @hta_monitoring.user_id
    click_on "Create Hta monitoring"

    assert_text "Hta monitoring was successfully created"
    click_on "Back"
  end

  test "updating a Hta monitoring" do
    visit hta_monitorings_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @hta_monitoring.comments
    fill_in "Patient", with: @hta_monitoring.patient_id
    fill_in "Status", with: @hta_monitoring.status
    fill_in "Tad", with: @hta_monitoring.tad
    fill_in "Tas", with: @hta_monitoring.tas
    fill_in "User", with: @hta_monitoring.user_id
    click_on "Update Hta monitoring"

    assert_text "Hta monitoring was successfully updated"
    click_on "Back"
  end

  test "destroying a Hta monitoring" do
    visit hta_monitorings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hta monitoring was successfully destroyed"
  end
end
