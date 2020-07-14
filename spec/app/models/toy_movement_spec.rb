require 'rails_helper'

RSpec.describe ToyMovement do
  let(:valid_input) { "PLACE 0,0,NORTH\nMOVE\nREPORT" }
  let(:invalid_input) { "Invalid-data" }

  describe "#default_position" do
    it "return default_position with valid data" do
      expect(described_class.default_position(valid_input.upcase.split("\n"))).to eq("00NORTH")
    end

    it "return default_position with invalid data" do
      expect(described_class.default_position(invalid_input)).to eq(invalid_input.first)
    end
  end

  describe "#calculate_move" do
    it "return robot position with valid data" do
      expect(described_class.calculate_move(valid_input)).to eq("0,1,NORTH")
    end

    it "return default_position with invalid data" do
      expect(described_class.calculate_move(invalid_input)).to eq("")
    end
  end
end
