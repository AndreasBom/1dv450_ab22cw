require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(first_name: "bob", last_name: "bobbsson", email: "anannn@an.na",
    password: "fooBar", password_confirmation: "fooBar" )

  end

  test "saving user" do
    assert_not_nil(@user)
  end

  test "Testing uniqueness of email" do
    user2 = User.create(first_name: "bob", last_name: "bobbsson", email: "anannn@an.na",
    password: "fooBar", password_confirmation: "fooBar" )

    assert(user2)
  end

end
