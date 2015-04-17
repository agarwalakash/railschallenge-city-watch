require 'test_helper'

class RespondersIndexTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
    post '/responders/', responder: { type: 'Police', name: 'P-100', capacity: 2 }
    post '/responders/', responder: { type: 'Medical', name: 'M-100', capacity: 3 }
  end

  test 'GET /responders/ should be empty when no responders exist' do
    Responder.destroy_all

    get '/responders/'

    assert_equal 200, response.status
    assert_equal [], JSON.parse(body)['responders']
  end

  test 'GET /responders/ should return all responders when some responders exist' do
    get '/responders/'
    assert_equal 200, response.status
    assert_equal(
      {
        'responders' => [
          {
            'emergency_code' => nil,
            'type' => 'Fire',
            'name' => 'F-100',
            'capacity' => 1,
            'on_duty' => false
          },
          {
            'emergency_code' => nil,
            'type' => 'Police',
            'name' => 'P-100',
            'capacity' => 2,
            'on_duty' => false
          },
          {
            'emergency_code' => nil,
            'type' => 'Medical',
            'name' => 'M-100',
            'capacity' => 3,
            'on_duty' => false
          }
        ]
      },
      JSON.parse(body)
    )
  end
end
