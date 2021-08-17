require "application_system_test_case"

class MedicationSchedulesTest < ApplicationSystemTestCase
  setup do
    @medication_schedule = medication_schedules(:one)
  end

  test "visiting the index" do
    visit medication_schedules_url
    assert_selector "h1", text: "Medication Schedules"
  end

  test "creating a Medication schedule" do
    visit medication_schedules_url
    click_on "New Medication Schedule"

    fill_in "Comments", with: @medication_schedule.comments
    fill_in "Doctor", with: @medication_schedule.doctor_id
    fill_in "Evening number", with: @medication_schedule.evening_number
    fill_in "Morning number", with: @medication_schedule.morning_number
    fill_in "Noo number", with: @medication_schedule.noo_number
    fill_in "Patient", with: @medication_schedule.patient_id
    fill_in "Status", with: @medication_schedule.status
    fill_in "Uid", with: @medication_schedule.uid
    fill_in "User", with: @medication_schedule.user_id
    click_on "Create Medication schedule"

    assert_text "Medication schedule was successfully created"
    click_on "Back"
  end

  test "updating a Medication schedule" do
    visit medication_schedules_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @medication_schedule.comments
    fill_in "Doctor", with: @medication_schedule.doctor_id
    fill_in "Evening number", with: @medication_schedule.evening_number
    fill_in "Morning number", with: @medication_schedule.morning_number
    fill_in "Noo number", with: @medication_schedule.noo_number
    fill_in "Patient", with: @medication_schedule.patient_id
    fill_in "Status", with: @medication_schedule.status
    fill_in "Uid", with: @medication_schedule.uid
    fill_in "User", with: @medication_schedule.user_id
    click_on "Update Medication schedule"

    assert_text "Medication schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Medication schedule" do
    visit medication_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medication schedule was successfully destroyed"
  end
end
