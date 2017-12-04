class CreditCardValidator
  def self.call(cc_number:)
    CreditCardValidator.new(cc_number).is_valid?
  end

  attr_reader :cc_number, :check_digit

  def initialize(cc_number)
    @cc_number = cc_number
  end

  def is_valid?
    checksum = calc_checksum
    checksum % 10 == 0
  end

  private

    def calc_checksum
      sum_digits.inject(:+)
    end

    def sum_digits
      cc_number_modulo = cc_number.length % 2
      cc_number.split("").map.with_index do |digit, i|
        if (i % 2) == cc_number_modulo
          (digit.to_i * 2).to_s.split("").map(&:to_i).inject(:+)
        else
          digit.to_i
        end
      end
    end
end
