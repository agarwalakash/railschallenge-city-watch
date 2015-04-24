require 'test_helper'

class RespondersCapacityTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
    post '/responders/', responder: { type: 'Fire', name: 'F-101', capacity: 2 }
    patch '/responders/F-101', responder: { on_duty: true }

    post '/responders/', responder: { type: 'Police', name: 'P-100', capacity: 3 }
    post '/responders/', responder: { type: 'Police', name: 'P-101', capacity: 4 }
    patch '/responders/P-100', responder: { on_duty: true }

    post '/responders/', responder: { type: 'Medical', name: 'M-100', capacity: 5 }
    post '/responders/', responder: { type: 'Medical', name: 'M-101', capacity: 1 }
    patch '/responders/M-100', responder: { on_duty: true }
    patch '/responders/M-101', responder: { on_duty: true }
  end

  test 'GET /responders/?show=capacity makes the emergency capacity available' do
    get '/responders/?show=capacity'
    assert_equal(
      {
        'capacity' => {
          'Fire' => [3, 3, 2, 2],
          'Police' => [7, 7, 3, 3],
          'Medical' => [6, 6, 6, 6]
        }
      }, JSON.parse(body)
    )
  end

  test 'GET /responders/?show=capacity increases and decreases as emergencies are created and resolved' do
    post '/emergencies/', emergency: { code: 'E-00000001', fire_severity: 1, police_severity: 7, medical_severity: 1 }
    get '/responders/?show=capacity'
    assert_equal(
      {
        'capacity' => {
          'Fire' => [3, 1, 2, 0],
          'Police' => [7, 4, 3, 0],
          'Medical' => [6, 5, 6, 5]
        }
      }, JSON.parse(body)
    )

    patch '/emergencies/E-00000001', emergency: { resolved_at: Time.zone.now }
    get '/responders/?show=capacity'
    assert_equal(
      {
        'capacity' => {
          'Fire' => [3, 3, 2, 2],
          'Police' => [7, 7, 3, 3],
          'Medical' => [6, 6, 6, 6]
        }
      }, JSON.parse(body)
    )
  end
end
