#
# Basic multiplication:
#

def basic_multiplication(n, a)
  return a if (n == 1) # The base case for the algorithm.
  return basic_multiplication(n - 1, a) + a
end

puts "basic_multiplication result:"
puts basic_multiplication(10, 10)

def improved_multiplication(n, a)
  return a if (n == 1) # The base case again.

  result = improved_multiplication(n / 2, a + a)
  result = result + a if n.odd?

  return result
end

puts "improved_multiplication result:"
puts improved_multiplication(100, 20)
