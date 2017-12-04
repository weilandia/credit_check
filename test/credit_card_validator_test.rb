require 'minitest/autorun'
require_relative '../lib/credit_card_validator'

class CreditCardValidatorTest < Minitest::Test
  def test_valid_number_1
    assert_equal(true, CreditCardValidator.call(cc_number: "5541808923795240"))
  end

  def test_valid_number_2
    assert_equal(true, CreditCardValidator.call(cc_number: "4024007136512380"))
  end

  def test_valid_number_3
    assert_equal(true, CreditCardValidator.call(cc_number: "6011797668867828"))
  end

  def test_invalid_number_1
    assert_equal(false, CreditCardValidator.call(cc_number: "5541801923795240"))
  end

  def test_invalid_number_2
    assert_equal(false, CreditCardValidator.call(cc_number: "4024007106512380"))
  end

  def test_invalid_number_3
    assert_equal(false, CreditCardValidator.call(cc_number: "6011797668868728"))
  end

  def test_american_express_valid
    assert_equal(true, CreditCardValidator.call(cc_number: "342804633855673"))
  end

  def test_american_express_invalid
    assert_equal(false, CreditCardValidator.call(cc_number: "342801633855673"))
  end
end
