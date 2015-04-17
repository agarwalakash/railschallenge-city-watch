require 'test_helper'

class EmergenciesFullResponsePercentageTest < ActionDispatch::IntegrationTest
  def setup
    post '/responders/', responder: { type: 'Fire', name: 'F-100', capacity: 1 }

    post '/emergencies/', emergency: { code: 'E-00000001', fire_severity: 1, police_severity: 0, medical_severity: 0 }
    post '/emergencies/', emergency: { code: 'E-00000002', fire_severity: 2, police_severity: 0, medical_severity: 0 }
    post '/emergencies/', emergency: { code: 'E-00000003', fire_severity: 3, police_severity: 0, medical_severity: 0 }

    patch '/emergencies/E-00000001', emergency: { resolved_at: Time.zone.now }
    patch '/emergencies/E-00000002', emergency: { resolved_at: Time.zone.now }
    patch '/emergencies/E-00000003', emergency: { resolved_at: Time.zone.now }
  end

  test 'GET /emergencies/ includes the full-response percentage' do
  end
end
