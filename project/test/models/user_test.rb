require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "bob", last_name: "bobbsson", email: "anan@an.na")
  end
end
