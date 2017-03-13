require 'rails_helper'

RSpec.describe Graffiti, type: :model do
  let(:subject) { Graffiti.new }

  it "has a default drawing" do
    subject = Graffiti.new
    expect(subject.drawing).to eq default_drawing
  end

  context "validating drawing" do
    it "is invalid with incorrect dimensions" do
      aggregate_failures do
        subject.drawing = Array.new(15) { Array.new(30) { "" } }
        expect(subject).not_to be_valid

        subject.drawing = Array.new(14) { Array.new(31) { "" } }
        expect(subject).not_to be_valid

        subject.drawing = Array.new(16) { Array.new(31) { "" } }
        expect(subject).not_to be_valid

        subject.drawing = Array.new(15) { Array.new(32) { "" } }
        expect(subject).not_to be_valid
      end
    end
  end

  let(:default_drawing) do
    Array.new(15) { Array.new(31) { "" } }
  end
end
