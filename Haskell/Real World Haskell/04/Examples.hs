-- length
--
-- Gives us a count of how many elements are in a list.

length [1..10] -- => 10


-- null
--
-- Determines whether a list has any elements.

null [] -- => True
null [1..10] -- => False


-- head
--
-- Returns the first element in a list.

head [1..10] -- => 1
head [] -- => Exception


-- tail
--
-- Returns everything BUT the head of a list.

tail [1..5] -- => [2, 3, 4, 5]
tail [1] -- => []
tail [] -- => Exception


-- last
--
-- Returns the last element in a list.

last [1..10] -- => 10
last [1] -- => 10
last [] -- => Exception


-- init
--
-- Returns all BUT the last element in a list.

init [1..5] -- => [1, 2, 3, 4]
init [1] -- => []
init [] -- => Exception
