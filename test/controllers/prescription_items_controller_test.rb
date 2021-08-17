require "test_helper"

class PrescriptionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescription_item = prescription_items(:one)
  end

  test "should get index" do
    get prescription_items_url
    assert_response :success
  end

  test "should get new" do
    get new_prescription_item_url
    assert_response :success
  end

  test "should create prescription_item" do
    assert_difference('PrescriptionItem.count') do
      post prescription_items_url, params: { prescription_item: { comment: @prescription_item.comment, medicament: @prescription_item.medicament, posologie: @prescription_item.posologie, prescription_id: @prescription_item.prescription_id, status: @prescription_item.status, uid: @prescription_item.uid, user_id: @prescription_item.user_id } }
    end

    assert_redirected_to prescription_item_url(PrescriptionItem.last)
  end

  test "should show prescription_item" do
    get prescription_item_url(@prescription_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_prescription_item_url(@prescription_item)
    assert_response :success
  end

  test "should update prescription_item" do
    patch prescription_item_url(@prescription_item), params: { prescription_item: { comment: @prescription_item.comment, medicament: @prescription_item.medicament, posologie: @prescription_item.posologie, prescription_id: @prescription_item.prescription_id, status: @prescription_item.status, uid: @prescription_item.uid, user_id: @prescription_item.user_id } }
    assert_redirected_to prescription_item_url(@prescription_item)
  end

  test "should destroy prescription_item" do
    assert_difference('PrescriptionItem.count', -1) do
      delete prescription_item_url(@prescription_item)
    end

    assert_redirected_to prescription_items_url
  end
end
