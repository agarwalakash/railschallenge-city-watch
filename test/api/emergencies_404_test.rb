require 'test_helper'

class Emergencies404Test < ActionDispatch::IntegrationTest
  test '404 on GET /emergencies/new' do
    get '/emergencies/new'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end

  test '404 on GET /emergencies/:code/edit' do
    get '/emergencies/F-100/edit'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end

  test '404 on DELETE /emergencies/:code' do
    delete '/emergencies/F-100'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end
end
