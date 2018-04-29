module Validating
  def validate(pins)
    pins_are_between_zero_and_ten?(pins)
  end

  def pins_are_between_zero_and_ten?(pins)
    raise RuntimeError, 'Pins must have a value from 0 to 10' if pins < 0 || pins > 10
  end

  def validate_if_two_rolls_not_more_as_strike
    if @two_rolls.reduce(&:+) > 10
      raise RuntimeError, 'Pin count exceeds pins on the lane'
    end
  end

  def validate_if_can_take_score
    if @frames.size < 10
      raise RuntimeError, 'Score cannot be taken until the end of the game'
    end

    if @frames.size == 10 && @frames.last.strike? || @frames.last.spare?
      raise RuntimeError, 'Game is not yet over, cannot score!' if @fill_balls.empty?
    end
  end

  def validate_if_game_over
    if @frames.size == 10 && @frames.last.open_frame?
      raise RuntimeError, 'Should not be able to roll after game is over'
    end
  end
end

class Frame
  attr_reader :trow1, :trow2

  def initialize(pins1, pins2 = 0)
    @trow1 = pins1
    @trow2 = pins2
  end

  def total
    trow1 + trow2
  end

  def strike?
    trow1 == 10 && trow2 == 0
  end

  def spare?
    total == 10
  end

  def open_frame?
    total < 10
  end
end

class Game
  include Validating
  
  def initialize
    @frames = []
    @two_rolls = []
    @fill_balls = []
  end

  def roll(pins)
    validate(pins)
    validate_if_game_over
    add_to_fill_balls(pins) && return if @frames.size == 10

    if pins == 10
      @frames << Frame.new(pins)
    else
      @two_rolls << pins
    end

    if @two_rolls.size == 2
      validate_if_two_rolls_not_more_as_strike
      @frames << Frame.new(*@two_rolls)
      @two_rolls = []
    end
  end

  def add_to_fill_balls(pins)
    @fill_balls << pins
    if @fill_balls.size > 1 && !@fill_balls.last(2).include?(10)
      raise RuntimeError, 'Pin count exceeds pins on the lane' if @fill_balls.last(2).reduce(&:+) > 10
    end
    @fill_balls
  end

  def score
    validate_if_can_take_score
  
    return 300 if @frames.all? {|frame| frame.strike? }
    frame_scores = @frames.map.with_index do |frame, idx|
      if frame.strike?
        calculate_for_strike(idx)
      elsif frame.spare?
        calculate_for_spare(idx)
      else
        frame.total
      end
    end

    frame_scores.reduce(&:+)
  end

  def calculate_for_strike(idx)
    return 10 + @fill_balls[0] + @fill_balls[1] if idx == @frames.size-1

    next_frame = @frames[idx+1]
    if next_frame.strike?
      10 + 10 + @frames[idx+2].trow1
    else
      10 + next_frame.total
    end
  end

  def calculate_for_spare(idx)
    return 10 + @fill_balls[0] if idx == @frames.size-1

    next_frame = @frames[idx+1]
    10 + next_frame.trow1
  end
end
