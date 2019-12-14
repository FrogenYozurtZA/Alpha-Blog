require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "Get new user form and create user in db" do
        get signup_path
        assert_template 'users/new'
        assert_difference 'User.count', 1 do
          post users_path, params: { user: {username: "TestUser", email: "test@example.com", password: "password"} }
          follow_redirect!
        end
        get users_path
        assert_template 'users/index'
        assert_match "TestUser", response.body
  end


end