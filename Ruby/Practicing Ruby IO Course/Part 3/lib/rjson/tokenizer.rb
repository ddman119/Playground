require 'strscan'

module RJSON
  class Tokenizer
    STRING = /"(?:[^"\\]|\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4}))*"/
    NUMBER = /-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?/
    TRUE   = /true/
    FALSE  = /false/
    NULL   = /null/

    def initialize(io)
      @scanner = StringScanner.new io.read
    end

    def next_token
      return if @scanner.eos?

      case
      when text = @scanner.scan(STRING) then [:STRING, text]
      when text = @scanner.scan(NUMBER) then [:NUMBER, text]
      when text = @scanner.scan(TRUE)   then [:TRUE, text]
      when text = @scanner.scan(FALSE)  then [:FALSE, text]
      when text = @scanner.scan(NULL)   then [:NULL, text]
      else
        x = @scanner.getch
        [x, x]
      end
    end
  end
end
