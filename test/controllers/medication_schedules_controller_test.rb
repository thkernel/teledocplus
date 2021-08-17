require "test_helper"

class MedicationSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medication_schedule = medication_schedules(:one)
  end

  test "should get index" do
    get medication_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_medication_schedule_url
    assert_response :success
  end

  test "should create medication_schedule" do
    assert_difference('MedicationSchedule.count') do
      post medication_schedules_url, params: { medication_schedule: { comments: @medication_schedule.comments, doctor_id: @medication_schedule.doctor_id, evening_number: @medication_schedule.evening_number, morning_number: @medication_schedule.morning_number, noo_number: @medication_schedule.noo_number, patient_id: @medication_schedule.patient_id, status: @medication_schedule.status, uid: @medication_schedule.uid, user_id: @medication_schedule.user_id } }
    end

    assert_redirected_to medication_schedule_url(MedicationSchedule.last)
  end

  test "should show medication_schedule" do
    get medication_schedule_url(@medication_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_medication_schedule_url(@medication_schedule)
    assert_response :success
  end

  test "should update medication_schedule" do
    patch medication_schedule_url(@medication_schedule), params: { medication_schedule: { comments: @medication_schedule.comments, doctor_id: @medication_schedule.doctor_id, evening_number: @medication_schedule.evening_number, morning_number: @medication_schedule.morning_number, noo_number: @medication_schedule.noo_number, patient_id: @medication_schedule.patient_id, status: @medication_schedule.status, uid: @medication_schedule.uid, user_id: @medication_schedule.user_id } }
    assert_redirected_to medication_schedule_url(@medication_schedule)
  end

  test "should destroy medication_schedule" do
    assert_difference('MedicationSchedule.count', -1) do
      delete medication_schedule_url(@medication_schedule)
    end

    assert_redirected_to medication_schedules_url
  end
end
