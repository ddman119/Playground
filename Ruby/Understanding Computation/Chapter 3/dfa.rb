class FARule < Struct.new(:state, :character, :next_state)
  def applies_to?(state, character)
    self.state == state && self.character == character
  end

  def follow
    next_state
  end

  def inspect
    "#<FARule #{state.inspect} --#{character.inspect}--> #{next_state.inspect}"
  end
end

class DFARulebook < Struct.new(:rules)
  def next_state(state, character)
    rule_for(state, character).follow
  end

  def rule_for(state, character)
    rules.detect { |rule| rule.applies_to? state, character }
  end
end

class DFA < Struct.new(:current_state, :accept_state, :rulebook)
  def accepting?
    accept_state.include? current_state
  end

  def read_character(character)
    self.current_state = rulebook.next_state(current_state, character)
  end

  def read_string(string)
    string.chars.each do |char|
      read_character char
    end
  end
end

rulebook = DFARulebook.new([
  FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
  FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
  FARule.new(3, 'a', 3), FARule.new(3, 'b', 4),
  FARule.new(4, 'a', 4), FARule.new(4, 'b', 4)
])

dfa = DFA.new(1, [4], rulebook)
dfa.read_string 'abbaaaaaa'

puts "Accepted!" if dfa.accepting?
