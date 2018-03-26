class Robot
  @robots = []

  def name
    @name ||= generate_robot_name
  end
  
  def self.robots
    @robots
  end

  def generate_robot_name
    robot_name = ''
    loop do
      2.times { robot_name << rand(65..90).chr }
      3.times { robot_name << rand(0..9).to_s }
      break unless Robot.robots.include?(robot_name)
      robot_name = ''
    end
    Robot.robots << robot_name
    robot_name
  end

  def reset
    Robot.robots.delete(@name)
    @name = nil
    name
  end
end
