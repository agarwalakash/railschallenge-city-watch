require 'test_helper'

class EmergenciesShowTest < ActionDispatch::IntegrationTest
  def setup
    super

    post '/emergencies/', emergency: { code: 'E-00000001', fire_severity: 1, police_severity: 2, medical_severity: 3 }
  end

  test 'GET /emergencies/:code simple get by code' do
    get '/emergencies/E-00000001'
    json_response = JSON.parse(body)

    assert_equal 'E-00000001', json_response['emergency']['code']
    assert_equal 1, json_response['emergency']['fire_severity']
    assert_equal 2, json_response['emergency']['police_severity']
    assert_equal 3, json_response['emergency']['medical_severity']
  end

  test 'GET /emergencies/:code 404 response' do
    get '/emergencies/non-existent-emergency-code'

    assert_equal 404, response.status
  end
end
