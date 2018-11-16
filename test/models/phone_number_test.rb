require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  def setup
    @phone = PhoneNumber.new(phone_number: "1234567890",
                             entity_id: 1,
                             phone_type_id: 1)
  end

  test "should be valid" do
    assert @phone.valid?
  end

  test "should be invalid" do
    @phone.phone_type_id = nil
    assert_not @phone.valid?
  end

  test "should remove characters that are not numbers" do
    @phone.phone_type_id = 1
    @phone.phone_number = "(000)-000-0000abc"
    @phone.save
    assert_equal @phone.phone_number, "0000000000"
  end

  test "should delete blank instances" do
    phone = PhoneNumber.new
    assert_no_difference 'PhoneNumber.count' do
      phone.save
    end
  end
end
