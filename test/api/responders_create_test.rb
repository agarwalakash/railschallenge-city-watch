require 'test_helper'

class RespondersCreateTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
    post '/responders/', responder: { type: 'Police', name: 'P-100', capacity: 2 }
    post '/responders/', responder: { type: 'Medical', name: 'M-100', capacity: 3 }
  end

  test 'POST /responders/ simple creation' do
    post '/responders/', responder: { type: 'Fire', name: 'F-NEW', capacity: 1 }
    body = JSON.parse(response.body)

    assert_equal 201, response.status
    assert_equal(
      {
        'responder' => {
          'emergency_code' => nil,
          'type' => 'Fire',
          'name' => 'F-NEW',
          'capacity' => 1,
          'on_duty' => false
        }
      },
      body
    )
  end

  test 'POST /responders/ capacity can be a number between 1..5' do
    post '/responders', responder: { type: 'Fire', name: 'F-200', capacity: 0 }
    assert_equal 422, response.status
    assert_equal({ 'message' => { 'capacity' => ['is not included in the list'] } }, JSON.parse(body))

    post '/responders', responder: { type: 'Fire', name: 'F-201', capacity: 1 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-202', capacity: 2 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-203', capacity: 3 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-204', capacity: 4 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-205', capacity: 5 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-206', capacity: 6 }
    assert_equal 422, response.status
    assert_equal({ 'message' => { 'capacity' => ['is not included in the list'] } }, JSON.parse(body))
  end

  test 'POST /responders/ name attribute must be unique' do
    post '/responders', responder: { type: 'Fire', name: 'F-not-unique', capacity: 1 }
    assert_equal 201, response.status

    post '/responders', responder: { type: 'Fire', name: 'F-not-unique', capacity: 1 }
    assert_equal 422, response.status
    assert_equal({ 'message' => { 'name' => ['has already been taken'] } }, JSON.parse(body))
  end

  test 'POST /responders/ cannot set emergency_code' do
    post '/responders', responder: { emergency_code: 'E-1001', type: 'Fire', name: 'F-SET-EMG-ID', capacity: 1 }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: emergency_code' }, JSON.parse(body))
  end

  test 'POST /responders/ cannot set id' do
    post '/responders', responder: { id: 1, type: 'Fire', name: 'F-SET-ID', capacity: 1 }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: id' }, JSON.parse(body))
  end

  test 'POST /responders/ cannot set on_duty' do
    post '/responders', responder: { on_duty: true, type: 'Fire', name: 'F-SET-ON-DUTY', capacity: 1 }

    assert_equal 422, response.status
    assert_equal({ 'message' => 'found unpermitted parameter: on_duty' }, JSON.parse(body))
  end

  test 'POST /responders/ lack of type returns an error' do
    post '/responders', responder: { name: 'F-101', capacity: 1 }

    assert_equal 422, response.status
    assert_equal({ 'message' => { 'type' => ['can\'t be blank'] } }, JSON.parse(body))
  end

  test 'POST /responders/ lack of name returns an error' do
    post '/responders', responder: { type: 'Fire', capacity: 1 }

    assert_equal 422, response.status
    assert_equal({ 'message' => { 'name' => ['can\'t be blank'] } }, JSON.parse(body))
  end

  test 'POST /responders/ lack of capacity returns an error' do
    post '/responders', responder: { type: 'Fire', name: 'F-101' }

    assert_equal 422, response.status
    assert_equal(
      {
        'message' => {
          'capacity' => ['can\'t be blank', 'is not included in the list']
        }
      },
      JSON.parse(body)
    )
  end

  test 'POST /responders/ lack of multiple required fields returns an error' do
    post '/responders', responder: { type: 'Fire' }

    assert_equal 422, response.status
    assert_equal(
      {
        'message' => {
          'name' => ['can\'t be blank'],
          'capacity' => ['can\'t be blank', 'is not included in the list']
        }
      },
      JSON.parse(body)
    )
  end
end
