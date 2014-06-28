require_relative '../calculator'

describe Calculator do
  it 'can add numbers' do
    result = Calculator.new.one.plus.two
    expect(result).to eq 3
  end

  it 'can subtract numbers' do
    result = Calculator.new.nine.minus.three
    expect(result).to eq 6
  end

  it 'can multiply numbers' do
    result = Calculator.new.one.times.two
    expect(result).to eq 2
  end

  it 'can divide numbers' do
    result = Calculator.new.eight.divided_by.two
    expect(result).to eq 4
  end
end
