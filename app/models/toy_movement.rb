class ToyMovement

  def self.default_position(data)
    data.first.gsub("PLACE ","").gsub(",","").gsub(" ","")
  end

  def self.calculate_move(data)
    position = "00NORTH"
  	robot_movements = data.upcase.split("\n")
  	position =  default_position(robot_movements) if robot_movements.first.start_with?("PLACE ")
  	toy_movement = PositionCalculator.new(position[0].to_i, position[1].to_i, position[2..-1].strip.upcase)

  	robot_movements[1..-2].each do |movement|
  		toy_movement.get_command(movement.strip)
  	end
  	return  robot_movement_position(toy_movement) if robot_movements.last.strip.start_with?("REPORT")
  	""

  end

  def self.robot_movement_position(toy_movement)
    "#{toy_movement.position_x},#{toy_movement.position_y},#{toy_movement.direction}"
  end
end
