require 'test_helper'

class RespondersUpdateTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
  end

  test 'PATCH /responders/:name can change on_duty' do
    get '/responders/F-100'
    assert_equal(false, JSON.parse(body)['responder']['on_duty'])

    patch '/responders/F-100', responder: { on_duty: true }
    assert_equal(true, JSON.parse(body)['responder']['on_duty'])
  end

  test 'PATCH /responders/:name cannot change emergency_code (it can only be set by the system)' do
    patch '/responders/F-100', responder: { emergency_code: 'E-101' }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: emergency_code' }, JSON.parse(body))
  end

  test 'PATCH /responders/:name cannot change type' do
    patch '/responders/F-100', responder: { type: 'Police' }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: type' }, JSON.parse(body))
  end

  test 'PATCH /responders/:name cannot change name' do
    patch '/responders/F-100', responder: { name: 'F-999' }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: name' }, JSON.parse(body))
  end

  test 'PATCH /responders/:name cannot change capacity' do
    patch '/responders/F-100', responder: { capacity: 7 }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: capacity' }, JSON.parse(body))
  end
end
