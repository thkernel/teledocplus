require "application_system_test_case"

class HeartFailureMonitoringsTest < ApplicationSystemTestCase
  setup do
    @heart_failure_monitoring = heart_failure_monitorings(:one)
  end

  test "visiting the index" do
    visit heart_failure_monitorings_url
    assert_selector "h1", text: "Heart Failure Monitorings"
  end

  test "creating a Heart failure monitoring" do
    visit heart_failure_monitorings_url
    click_on "New Heart Failure Monitoring"

    check "Breathlessness" if @heart_failure_monitoring.breathlessness
    fill_in "Cardiac frequency", with: @heart_failure_monitoring.cardiac_frequency
    fill_in "Comments", with: @heart_failure_monitoring.comments
    check "Feet swelling" if @heart_failure_monitoring.feet_swelling
    fill_in "Patient", with: @heart_failure_monitoring.patient_id
    fill_in "Status", with: @heart_failure_monitoring.status
    fill_in "Uid", with: @heart_failure_monitoring.uid
    fill_in "User", with: @heart_failure_monitoring.user_id
    fill_in "Weight", with: @heart_failure_monitoring.weight
    click_on "Create Heart failure monitoring"

    assert_text "Heart failure monitoring was successfully created"
    click_on "Back"
  end

  test "updating a Heart failure monitoring" do
    visit heart_failure_monitorings_url
    click_on "Edit", match: :first

    check "Breathlessness" if @heart_failure_monitoring.breathlessness
    fill_in "Cardiac frequency", with: @heart_failure_monitoring.cardiac_frequency
    fill_in "Comments", with: @heart_failure_monitoring.comments
    check "Feet swelling" if @heart_failure_monitoring.feet_swelling
    fill_in "Patient", with: @heart_failure_monitoring.patient_id
    fill_in "Status", with: @heart_failure_monitoring.status
    fill_in "Uid", with: @heart_failure_monitoring.uid
    fill_in "User", with: @heart_failure_monitoring.user_id
    fill_in "Weight", with: @heart_failure_monitoring.weight
    click_on "Update Heart failure monitoring"

    assert_text "Heart failure monitoring was successfully updated"
    click_on "Back"
  end

  test "destroying a Heart failure monitoring" do
    visit heart_failure_monitorings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heart failure monitoring was successfully destroyed"
  end
end
