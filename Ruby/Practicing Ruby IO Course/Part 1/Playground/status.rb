`cat somefile`
cat_success = $?

`echo 'Hello world'`
echo_success = $?

puts "Cat succeeded!" if cat_success.exitstatus == 0
puts "Echo succeeded!" if echo_success.exitstatus == 0
