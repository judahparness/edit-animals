require 'test_helper'

class EnclosuresControllerTest < ActionController::TestCase
  setup do
    @enclosure = enclosures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enclosures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enclosure" do
    assert_difference('Enclosure.count') do
      post :create, enclosure: { number: @enclosure.number, type: @enclosure.type }
    end

    assert_redirected_to enclosure_path(assigns(:enclosure))
  end

  test "should show enclosure" do
    get :show, id: @enclosure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enclosure
    assert_response :success
  end

  test "should update enclosure" do
    patch :update, id: @enclosure, enclosure: { number: @enclosure.number, type: @enclosure.type }
    assert_redirected_to enclosure_path(assigns(:enclosure))
  end

  test "should destroy enclosure" do
    assert_difference('Enclosure.count', -1) do
      delete :destroy, id: @enclosure
    end

    assert_redirected_to enclosures_path
  end
end
