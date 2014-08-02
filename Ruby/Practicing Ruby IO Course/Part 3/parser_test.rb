require_relative 'lib/rjson'
require 'stringio'

input   = StringIO.new '{"foo":"bar"}'
tok     = RJSON::Tokenizer.new input
parser  = RJSON::Parser.new tok
handler = parser.parse
puts handler.result
