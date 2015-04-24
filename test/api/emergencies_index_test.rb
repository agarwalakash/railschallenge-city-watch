require 'test_helper'

class EmergenciesIndexTest < ActionDispatch::IntegrationTest
  test 'GET /emergencies/ should be empty when no emergencies exist' do
    get '/emergencies/'

    assert_equal 200, response.status
    assert_equal [], JSON.parse(body)['emergencies']
  end

  test 'GET /emergencies/ should return all emergencies when some emergencies exist' do
    post '/emergencies/', emergency: { code: 'E-00000001', fire_severity: 0, police_severity: 1, medical_severity: 2 }

    get '/emergencies/'
    assert_equal 200, response.status

    json_response = JSON.parse(body)
    assert_equal(json_response['emergencies'][0]['code'], 'E-00000001')
    assert_equal(json_response['emergencies'][0]['fire_severity'], 0)
    assert_equal(json_response['emergencies'][0]['police_severity'], 1)
    assert_equal(json_response['emergencies'][0]['medical_severity'], 2)
  end

  test 'GET /emergencies/ includes the full_responses counts' do
    setup_resolved_emergencies

    get '/emergencies/'
    assert_equal 200, response.status

    json_response = JSON.parse(body)
    assert_equal([1, 3], json_response['full_responses'])
    # ...where [1, 3] are NOT database ids, if that's what you're expecting.
    #
    # 1 = the number of `full_response` emergencies in the system
    # 3 = the total number of emergencies in the system
    #
    # see `setup_resolved_emergencies`
  end

  def setup_resolved_emergencies
    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }
    patch '/responders/F-100', responder: { on_duty: true }

    post '/emergencies/', emergency: { code: 'E-00000001', fire_severity: 1, police_severity: 0, medical_severity: 0 }
    post '/emergencies/', emergency: { code: 'E-00000002', fire_severity: 2, police_severity: 0, medical_severity: 0 }
    post '/emergencies/', emergency: { code: 'E-00000003', fire_severity: 3, police_severity: 0, medical_severity: 0 }

    patch '/emergencies/E-00000001', emergency: { resolved_at: Time.zone.now } # the only full-response emergency
    patch '/emergencies/E-00000002', emergency: { resolved_at: Time.zone.now }
    patch '/emergencies/E-00000003', emergency: { resolved_at: Time.zone.now }
  end
end
