require 'test_helper'

class Responders404Test < ActionDispatch::IntegrationTest
  test '404 on GET /responders/new' do
    get '/responders/new'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end

  test '404 on GET /responders/:name/edit' do
    get '/responders/F-100/edit'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end

  test '404 on DELETE /responders/:name' do
    delete '/responders/F-100'
    assert_equal 404, response.status
    assert_equal({ 'message' => 'page not found' }, JSON.parse(body))
  end
end
