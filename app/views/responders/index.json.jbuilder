json.array!(@responders) do |responder|
  json.extract! responder, :id, :name, :type
  json.url responder_url(responder, format: :json)
end
