class PositionCalculator
  DIRECTION = {"EAST" => 90, "WEST" => 270, "NORTH" => 0, "SOUTH" => 180}
  DIRECTION_COORDINATES = {
    "NORTH" => [0, 1],
    "EAST" => [1, 0],
    "SOUTH" => [0, -1],
    "WEST" => [-1, 0]
  }
  TURN = {"LEFT" => -90, "RIGHT" => 90}
  MOVE_COMMAND = "MOVE"

  attr_accessor :position_x, :position_y
  attr_accessor :direction

  def initialize(position_x = 0, position_y = 0, direction = 'NORTH')
    validate_positions(position_x, position_y)
    validate_direction(direction)
    @position_x, @position_y = position_x, position_y
    @direction = direction
    set_robot_direction
  end

  def rotate(data)
    current_direction = DIRECTION[@direction]
    turn_data = TURN[data]
    @new_direction_value = current_direction + turn_data
    check_limits
    @direction = DIRECTION.key(@new_direction_value)
  end

  def move(move_x, move_y)
    set_robot_direction
    @position_x = @position_x + move_x * @direction_x
    @position_y = @position_y + move_y * @direction_y
  end

  def get_command(command)
    validate_command(command)
    rotate(command) and return if TURN.keys.include?(command)
    move(1, 1) and return if command == MOVE_COMMAND
  end

  private

	  def check_limits
	    @new_direction_value = 270 if @new_direction_value < 0
	    @new_direction_value = 0 if @new_direction_value > 270
	  end

	  def set_robot_direction
	    @direction_x = DIRECTION_COORDINATES[@direction][0]
	    @direction_y = DIRECTION_COORDINATES[@direction][1]
	  end

	  def validate_positions(position_x, position_y)
	    unless position_x.is_a?(Integer) && position_y.is_a?(Integer)
	      raise "Please enter valid number."
	    end
	  end

	  def validate_direction(direction)
	    unless DIRECTION.keys.include?(direction)
	      raise "Invalid Direction."
	    end
	  end

	  def validate_command(command)
	    unless (TURN.keys + [MOVE_COMMAND]).include?(command)
	      raise "Invalid Command."
	    end
	  end

end
