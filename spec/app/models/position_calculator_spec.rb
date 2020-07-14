require 'rails_helper'

RSpec.describe PositionCalculator do
  let(:position_x) { 0 }
  let(:position_y) { 0 }
  let(:direction)  { "NORTH" }

  describe "#get_command" do
    let(:subject) { described_class.new(position_x, position_y, direction) }

    context "validate direction command" do
      before(:each) do
        subject
      end
      it "return nil if valid command" do
        expect(subject.get_command("RIGHT")).to eq(nil)
      end

      it "return error invalid command" do
        expect{ subject.get_command("Invalid") }.to raise_error(RuntimeError, "Invalid Command.")
      end
    end

    context "validate position" do
      let(:position_x) { "A" }

      it "return error if invalid position" do
        expect{ subject }.to raise_error(RuntimeError, "Please enter valid number.")
      end
    end
  end

end
