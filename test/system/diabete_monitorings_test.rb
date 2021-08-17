require "application_system_test_case"

class DiabeteMonitoringsTest < ApplicationSystemTestCase
  setup do
    @diabete_monitoring = diabete_monitorings(:one)
  end

  test "visiting the index" do
    visit diabete_monitorings_url
    assert_selector "h1", text: "Diabete Monitorings"
  end

  test "creating a Diabete monitoring" do
    visit diabete_monitorings_url
    click_on "New Diabete Monitoring"

    check "Amaigrissement" if @diabete_monitoring.amaigrissement
    fill_in "Comments", with: @diabete_monitoring.comments
    check "Fatigue majoree" if @diabete_monitoring.fatigue_majoree
    fill_in "Glycemie a jeun", with: @diabete_monitoring.glycemie_a_jeun
    check "Irritabilite" if @diabete_monitoring.irritabilite
    fill_in "Patient", with: @diabete_monitoring.patient_id
    check "Polyurie majoree" if @diabete_monitoring.polyurie_majoree
    check "Sensation de faim" if @diabete_monitoring.sensation_de_faim
    fill_in "Status", with: @diabete_monitoring.status
    check "Sueurs" if @diabete_monitoring.sueurs
    check "Tremblement" if @diabete_monitoring.tremblement
    fill_in "Uid", with: @diabete_monitoring.uid
    fill_in "User", with: @diabete_monitoring.user_id
    check "Vertige" if @diabete_monitoring.vertige
    click_on "Create Diabete monitoring"

    assert_text "Diabete monitoring was successfully created"
    click_on "Back"
  end

  test "updating a Diabete monitoring" do
    visit diabete_monitorings_url
    click_on "Edit", match: :first

    check "Amaigrissement" if @diabete_monitoring.amaigrissement
    fill_in "Comments", with: @diabete_monitoring.comments
    check "Fatigue majoree" if @diabete_monitoring.fatigue_majoree
    fill_in "Glycemie a jeun", with: @diabete_monitoring.glycemie_a_jeun
    check "Irritabilite" if @diabete_monitoring.irritabilite
    fill_in "Patient", with: @diabete_monitoring.patient_id
    check "Polyurie majoree" if @diabete_monitoring.polyurie_majoree
    check "Sensation de faim" if @diabete_monitoring.sensation_de_faim
    fill_in "Status", with: @diabete_monitoring.status
    check "Sueurs" if @diabete_monitoring.sueurs
    check "Tremblement" if @diabete_monitoring.tremblement
    fill_in "Uid", with: @diabete_monitoring.uid
    fill_in "User", with: @diabete_monitoring.user_id
    check "Vertige" if @diabete_monitoring.vertige
    click_on "Update Diabete monitoring"

    assert_text "Diabete monitoring was successfully updated"
    click_on "Back"
  end

  test "destroying a Diabete monitoring" do
    visit diabete_monitorings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diabete monitoring was successfully destroyed"
  end
end
