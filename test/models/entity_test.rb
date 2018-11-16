require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    @user = Entity.new(username: "jackdoe",
                       password: "foobar",
                       password_confirmation: "foobar",
                       entity_type_id: 1)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    @user.email = "foo@example.com"
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated phone number should be destroyed" do
    @user.save
    @user.phone_numbers.create!(phone_number: "1234567890", phone_type_id: 1)
    assert_difference 'PhoneNumber.count', -1 do
      @user.destroy
    end
  end
end
