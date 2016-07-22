require "test_helper"

class RespondersControllerTest < ActionController::TestCase

  def responder
    @responder ||= responders :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:responders)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Responder.count') do
      post :create, responder: { name: responder.name, type: responder.type }
    end

    assert_redirected_to responder_path(assigns(:responder))
  end

  def test_show
    get :show, id: responder
    assert_response :success
  end

  def test_edit
    get :edit, id: responder
    assert_response :success
  end

  def test_update
    put :update, id: responder, responder: { name: responder.name, type: responder.type }
    assert_redirected_to responder_path(assigns(:responder))
  end

  def test_destroy
    assert_difference('Responder.count', -1) do
      delete :destroy, id: responder
    end

    assert_redirected_to responders_path
  end
end
