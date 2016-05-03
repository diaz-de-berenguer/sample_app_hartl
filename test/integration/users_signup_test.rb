require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, user: {
  			name: "", email: "invalid.com",
  			password: "sh", password_confirmation: "different"
  		}
  	end
  	assert_template 'users/new'
  end

  test "user account created succesfully" do
  	get signup_path
  	assert_difference 'User.count', 1 do
  		post_via_redirect users_path, user: {
  			name: "Name", email: "is@valid.com",
  			password: "password", password_confirmation: "password"
  		}
  	end
  	assert_template 'users/show'
  end
end
