class CreditCardValidator
  def self.call(cc_number:)
    CreditCardValidator.new(cc_number).is_valid?
  end

  attr_reader :cc_number, :check_digit

  def initialize(cc_number)
    @cc_number = cc_number
  end

  def is_valid?
    checksum = luhn_checksum
    checksum % 10 == 0
  end

  private

    def luhn_checksum
      sum_digits_array.inject(:+)
    end

    def sum_digits_array
      cc_number.split("").map.with_index do |digit, i|
        sum_digit(digit: digit.to_i, index: i)
      end
    end

    def sum_digit(digit:, index:)
      if index_should_double_sum?(index)
        double_sum_digit(double_digit: digit * 2)
      else
        digit
      end
    end

    def double_sum_digit(double_digit:)
      if double_digit <= 9
        double_digit
      else
        double_digit - 9
      end
    end

    def index_should_double_sum?(index)
      (index % 2) == cc_number_modulo
    end

    def cc_number_modulo
      cc_number.length % 2
    end
end
