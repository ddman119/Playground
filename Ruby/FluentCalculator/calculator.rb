class Calculator
  attr_reader :value
  attr_reader :operator

  def initialize(value = 0, operator = nil)
    @value = value
    @operator = operator
  end

  def one
    calculator_with_value 1
  end

  def two
    calculator_with_value 2
  end

  def three
    calculator_with_value 3
  end

  def four
    calculator_with_value 4
  end

  def five
    calculator_with_value 5
  end

  def six
    calculator_with_value 6
  end

  def seven
    calculator_with_value 7
  end

  def eight
    calculator_with_value 8
  end

  def nine
    calculator_with_value 9
  end

  def calculator_with_value(new_value)
    unless operator.nil?
      if operator == '+'
        new_value = value + new_value
      elsif operator == '-'
        new_value = value - new_value
      elsif operator == '*'
        new_value = value * new_value
      else
        new_value = value / new_value
      end

      return new_value
    end

    Calculator.new new_value
  end

  def plus
    Calculator.new value, '+'
  end

  def minus
    Calculator.new value, '-'
  end

  def times
    Calculator.new value, '*'
  end

  def divided_by
    Calculator.new value, '/'
  end
end
