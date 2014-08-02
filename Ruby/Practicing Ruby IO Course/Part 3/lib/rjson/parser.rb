#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'
module RJSON
  class Parser < Racc::Parser
    require_relative 'handler'

    attr_reader :handler

    def initialize tokenizer, handler = Handler.new
      @tokenizer = tokenizer
      @handler   = handler
      super()
    end

    def next_token
      @tokenizer.next_token
    end

    def parse
      do_parse
      handler
    end
##### State transition tables begin ###

racc_action_table = [
    11,    16,    19,    20,    21,     4,    11,     5,    12,    11,
    16,    19,    20,    21,     4,    25,     5,    11,    16,    19,
    20,    21,     4,    11,     5,    23,    26,    27,    24,     7,
     4,     6,     5,    22 ]

racc_action_check = [
     5,     5,     5,     5,     5,     5,    24,     5,     5,    25,
    25,    25,    25,    25,    25,    10,    25,    27,    27,    27,
    27,    27,    27,     4,    27,     8,    13,    13,     8,     4,
     0,     1,     0,     6 ]

racc_action_pointer = [
    23,    31,   nil,   nil,    21,    -2,    33,   nil,    17,   nil,
     3,   nil,   nil,    16,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     4,     7,   nil,    15,   nil,   nil,
   nil ]

racc_action_default = [
   -20,   -20,    -1,    -2,   -20,   -20,   -20,    -3,   -20,   -17,
   -20,   -19,    -5,   -20,    -8,    -9,   -10,   -11,   -12,   -13,
   -14,   -15,    31,    -4,   -20,   -20,    -6,   -20,   -16,   -18,
    -7 ]

racc_goto_table = [
    14,    10,    13,     9,     8,     3,     2,     1,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    29,    10,    30,    28 ]

racc_goto_check = [
     6,     7,     5,     8,     4,     3,     2,     1,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     6,     7,     6,     8 ]

racc_goto_pointer = [
   nil,     7,     6,     5,     0,    -3,    -5,    -3,    -1 ]

racc_goto_default = [
   nil,   nil,    17,    18,   nil,   nil,   nil,    15,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 14, :_reduce_none,
  1, 14, :_reduce_none,
  2, 15, :_reduce_none,
  3, 15, :_reduce_none,
  2, 16, :_reduce_none,
  3, 16, :_reduce_none,
  3, 18, :_reduce_none,
  1, 18, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  3, 17, :_reduce_none,
  1, 17, :_reduce_none,
  3, 21, :_reduce_none,
  1, 20, :_reduce_none ]

racc_reduce_n = 20

racc_shift_n = 31

racc_token_table = {
  false => 0,
  :error => 1,
  :STRING => 2,
  :NUMBER => 3,
  :TRUE => 4,
  :FALSE => 5,
  :NULL => 6,
  "{" => 7,
  "}" => 8,
  "[" => 9,
  "]" => 10,
  "," => 11,
  ":" => 12 }

racc_nt_base = 13

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "STRING",
  "NUMBER",
  "TRUE",
  "FALSE",
  "NULL",
  "\"{\"",
  "\"}\"",
  "\"[\"",
  "\"]\"",
  "\",\"",
  "\":\"",
  "$start",
  "document",
  "object",
  "array",
  "pairs",
  "values",
  "value",
  "string",
  "pair" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module RJSON
