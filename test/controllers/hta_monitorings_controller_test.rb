require "test_helper"

class HtaMonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hta_monitoring = hta_monitorings(:one)
  end

  test "should get index" do
    get hta_monitorings_url
    assert_response :success
  end

  test "should get new" do
    get new_hta_monitoring_url
    assert_response :success
  end

  test "should create hta_monitoring" do
    assert_difference('HtaMonitoring.count') do
      post hta_monitorings_url, params: { hta_monitoring: { comments: @hta_monitoring.comments, patient_id: @hta_monitoring.patient_id, status: @hta_monitoring.status, tad: @hta_monitoring.tad, tas: @hta_monitoring.tas, user_id: @hta_monitoring.user_id } }
    end

    assert_redirected_to hta_monitoring_url(HtaMonitoring.last)
  end

  test "should show hta_monitoring" do
    get hta_monitoring_url(@hta_monitoring)
    assert_response :success
  end

  test "should get edit" do
    get edit_hta_monitoring_url(@hta_monitoring)
    assert_response :success
  end

  test "should update hta_monitoring" do
    patch hta_monitoring_url(@hta_monitoring), params: { hta_monitoring: { comments: @hta_monitoring.comments, patient_id: @hta_monitoring.patient_id, status: @hta_monitoring.status, tad: @hta_monitoring.tad, tas: @hta_monitoring.tas, user_id: @hta_monitoring.user_id } }
    assert_redirected_to hta_monitoring_url(@hta_monitoring)
  end

  test "should destroy hta_monitoring" do
    assert_difference('HtaMonitoring.count', -1) do
      delete hta_monitoring_url(@hta_monitoring)
    end

    assert_redirected_to hta_monitorings_url
  end
end
