class SecretHandshake
  COMMANDS = { 1 => "wink", 10 => "double blink", 100 => "close your eyes", 1000 => "jump", 10_000 => "reverse" }
  
  def initialize(number)
    if number.is_a?(Integer)
      @binary = number.to_s(2).reverse
    else
      number.match(/[^0-1]/) ? @binary = '0' : @binary = number.reverse
    end
  end
  
  def commands
    place = 1
    list = []
    @binary.each_char do |bin|
      if bin == "1"
        command = COMMANDS[place]
        command == 'reverse' ? list.reverse! : list << command
      end
      place *= 10
    end
    list
  end
end