require "test_helper"

class HeartFailureMonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heart_failure_monitoring = heart_failure_monitorings(:one)
  end

  test "should get index" do
    get heart_failure_monitorings_url
    assert_response :success
  end

  test "should get new" do
    get new_heart_failure_monitoring_url
    assert_response :success
  end

  test "should create heart_failure_monitoring" do
    assert_difference('HeartFailureMonitoring.count') do
      post heart_failure_monitorings_url, params: { heart_failure_monitoring: { breathlessness: @heart_failure_monitoring.breathlessness, cardiac_frequency: @heart_failure_monitoring.cardiac_frequency, comments: @heart_failure_monitoring.comments, feet_swelling: @heart_failure_monitoring.feet_swelling, patient_id: @heart_failure_monitoring.patient_id, status: @heart_failure_monitoring.status, uid: @heart_failure_monitoring.uid, user_id: @heart_failure_monitoring.user_id, weight: @heart_failure_monitoring.weight } }
    end

    assert_redirected_to heart_failure_monitoring_url(HeartFailureMonitoring.last)
  end

  test "should show heart_failure_monitoring" do
    get heart_failure_monitoring_url(@heart_failure_monitoring)
    assert_response :success
  end

  test "should get edit" do
    get edit_heart_failure_monitoring_url(@heart_failure_monitoring)
    assert_response :success
  end

  test "should update heart_failure_monitoring" do
    patch heart_failure_monitoring_url(@heart_failure_monitoring), params: { heart_failure_monitoring: { breathlessness: @heart_failure_monitoring.breathlessness, cardiac_frequency: @heart_failure_monitoring.cardiac_frequency, comments: @heart_failure_monitoring.comments, feet_swelling: @heart_failure_monitoring.feet_swelling, patient_id: @heart_failure_monitoring.patient_id, status: @heart_failure_monitoring.status, uid: @heart_failure_monitoring.uid, user_id: @heart_failure_monitoring.user_id, weight: @heart_failure_monitoring.weight } }
    assert_redirected_to heart_failure_monitoring_url(@heart_failure_monitoring)
  end

  test "should destroy heart_failure_monitoring" do
    assert_difference('HeartFailureMonitoring.count', -1) do
      delete heart_failure_monitoring_url(@heart_failure_monitoring)
    end

    assert_redirected_to heart_failure_monitorings_url
  end
end
