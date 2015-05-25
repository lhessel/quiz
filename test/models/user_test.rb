require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username must be unique" do
    assert_raise ActiveRecord::RecordInvalid do
      User.create! username: users(:one).username
    end
  end
end
