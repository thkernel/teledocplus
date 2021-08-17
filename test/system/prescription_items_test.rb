require "application_system_test_case"

class PrescriptionItemsTest < ApplicationSystemTestCase
  setup do
    @prescription_item = prescription_items(:one)
  end

  test "visiting the index" do
    visit prescription_items_url
    assert_selector "h1", text: "Prescription Items"
  end

  test "creating a Prescription item" do
    visit prescription_items_url
    click_on "New Prescription Item"

    fill_in "Comment", with: @prescription_item.comment
    fill_in "Medicament", with: @prescription_item.medicament
    fill_in "Posologie", with: @prescription_item.posologie
    fill_in "Prescription", with: @prescription_item.prescription_id
    fill_in "Status", with: @prescription_item.status
    fill_in "Uid", with: @prescription_item.uid
    fill_in "User", with: @prescription_item.user_id
    click_on "Create Prescription item"

    assert_text "Prescription item was successfully created"
    click_on "Back"
  end

  test "updating a Prescription item" do
    visit prescription_items_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @prescription_item.comment
    fill_in "Medicament", with: @prescription_item.medicament
    fill_in "Posologie", with: @prescription_item.posologie
    fill_in "Prescription", with: @prescription_item.prescription_id
    fill_in "Status", with: @prescription_item.status
    fill_in "Uid", with: @prescription_item.uid
    fill_in "User", with: @prescription_item.user_id
    click_on "Update Prescription item"

    assert_text "Prescription item was successfully updated"
    click_on "Back"
  end

  test "destroying a Prescription item" do
    visit prescription_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prescription item was successfully destroyed"
  end
end
