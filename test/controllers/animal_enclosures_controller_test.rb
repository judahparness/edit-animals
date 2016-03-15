require 'test_helper'

class AnimalEnclosuresControllerTest < ActionController::TestCase
  setup do
    @animal_enclosure = animal_enclosures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animal_enclosures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal_enclosure" do
    assert_difference('AnimalEnclosure.count') do
      post :create, animal_enclosure: { animal_id: @animal_enclosure.animal_id, enclosure_id: @animal_enclosure.enclosure_id }
    end

    assert_redirected_to animal_enclosure_path(assigns(:animal_enclosure))
  end

  test "should show animal_enclosure" do
    get :show, id: @animal_enclosure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal_enclosure
    assert_response :success
  end

  test "should update animal_enclosure" do
    patch :update, id: @animal_enclosure, animal_enclosure: { animal_id: @animal_enclosure.animal_id, enclosure_id: @animal_enclosure.enclosure_id }
    assert_redirected_to animal_enclosure_path(assigns(:animal_enclosure))
  end

  test "should destroy animal_enclosure" do
    assert_difference('AnimalEnclosure.count', -1) do
      delete :destroy, id: @animal_enclosure
    end

    assert_redirected_to animal_enclosures_path
  end
end
