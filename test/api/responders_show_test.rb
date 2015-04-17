require 'test_helper'

class RespondersShowTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
  end

  test 'GET /responders/:name simple get by name' do
    get '/responders/F-100'

    assert_equal(
      {
        'responder' => {
          'emergency_code' => nil,
          'type' => 'Fire',
          'name' => 'F-100',
          'capacity' => 1,
          'on_duty' => false
        }
      },
      JSON.parse(body)
    )
  end

  test 'GET /responders/:name 404 response' do
    get '/responders/non-existent-responder-name'

    assert_equal 404, response.status
  end
end
