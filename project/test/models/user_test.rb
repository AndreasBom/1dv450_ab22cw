require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "setup" do
    @user = User.new(first_name: "bob", last_name: "bobbsson", email: "anan@an.na")
  end
end
