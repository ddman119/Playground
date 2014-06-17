1. What are the types of the following expressions?

* False :: Bool
* (["foo", "bar"], 'a') :: ([[Char]], Char)
* [(True, []), (False, [['a']])] :: [(Bool, [[Char]])]

2. What are the valid behaviours of the function `last :: [a] -> a`? What can it not do?

This function can take an array of some type, and return a single instance of that type.

It cannot return a modified value of a, or some other value. It can purely return one of the values that exists in the given array.

It also cannot do anything that would involve side effects, like downloading data from the network.
