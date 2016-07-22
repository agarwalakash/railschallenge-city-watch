json.array!(@emergencies) do |emergency|
  json.extract! emergency, :id, :reason, :fire_need, :police_need, :medical_need, :city
  json.url emergency_url(emergency, format: :json)
end
