require "test_helper"

class DiabeteMonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diabete_monitoring = diabete_monitorings(:one)
  end

  test "should get index" do
    get diabete_monitorings_url
    assert_response :success
  end

  test "should get new" do
    get new_diabete_monitoring_url
    assert_response :success
  end

  test "should create diabete_monitoring" do
    assert_difference('DiabeteMonitoring.count') do
      post diabete_monitorings_url, params: { diabete_monitoring: { amaigrissement: @diabete_monitoring.amaigrissement, comments: @diabete_monitoring.comments, fatigue_majoree: @diabete_monitoring.fatigue_majoree, glycemie_a_jeun: @diabete_monitoring.glycemie_a_jeun, irritabilite: @diabete_monitoring.irritabilite, patient_id: @diabete_monitoring.patient_id, polyurie_majoree: @diabete_monitoring.polyurie_majoree, sensation_de_faim: @diabete_monitoring.sensation_de_faim, status: @diabete_monitoring.status, sueurs: @diabete_monitoring.sueurs, tremblement: @diabete_monitoring.tremblement, uid: @diabete_monitoring.uid, user_id: @diabete_monitoring.user_id, vertige: @diabete_monitoring.vertige } }
    end

    assert_redirected_to diabete_monitoring_url(DiabeteMonitoring.last)
  end

  test "should show diabete_monitoring" do
    get diabete_monitoring_url(@diabete_monitoring)
    assert_response :success
  end

  test "should get edit" do
    get edit_diabete_monitoring_url(@diabete_monitoring)
    assert_response :success
  end

  test "should update diabete_monitoring" do
    patch diabete_monitoring_url(@diabete_monitoring), params: { diabete_monitoring: { amaigrissement: @diabete_monitoring.amaigrissement, comments: @diabete_monitoring.comments, fatigue_majoree: @diabete_monitoring.fatigue_majoree, glycemie_a_jeun: @diabete_monitoring.glycemie_a_jeun, irritabilite: @diabete_monitoring.irritabilite, patient_id: @diabete_monitoring.patient_id, polyurie_majoree: @diabete_monitoring.polyurie_majoree, sensation_de_faim: @diabete_monitoring.sensation_de_faim, status: @diabete_monitoring.status, sueurs: @diabete_monitoring.sueurs, tremblement: @diabete_monitoring.tremblement, uid: @diabete_monitoring.uid, user_id: @diabete_monitoring.user_id, vertige: @diabete_monitoring.vertige } }
    assert_redirected_to diabete_monitoring_url(@diabete_monitoring)
  end

  test "should destroy diabete_monitoring" do
    assert_difference('DiabeteMonitoring.count', -1) do
      delete diabete_monitoring_url(@diabete_monitoring)
    end

    assert_redirected_to diabete_monitorings_url
  end
end
