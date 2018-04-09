class Robot
  attr_accessor :coordinates
  def orient(direction)
    raise ArgumentError unless [:west, :east, :south, :north].include?(direction)
    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    set_direction("right")
  end

  def turn_left
    set_direction("left")
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when :north then coordinates[1] += 1
    when :south then coordinates[1] -= 1
    when :east then coordinates[0] += 1
    when :west then coordinates[0] -= 1
    end
  end

  private

  def set_direction(turn)
    @direction = case bearing, 
                 when :north
                   turn == "left" ? :west : :east
                 when :east
                   turn == "left" ? :north : :south
                 when :south
                   turn == "left" ? :east : :west
                 when :west
                   turn == "left" ? :south : :north
                 end
  end
end

class Simulator
  COMMANDS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(commands)
    commands.chars.map { |letter| COMMANDS[letter] }
  end

  def place(robot, set)
    robot.at(set[:x], set[:y])
    robot.orient(set[:direction])
  end

  def evaluate(robot, commands)
    commands = instructions(commands)
    commands.each { |command| robot.send(command) }
  end
end
