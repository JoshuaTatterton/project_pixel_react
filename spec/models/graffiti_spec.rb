require 'rails_helper'

RSpec.describe Graffiti, type: :model do
  it "has a default drawing" do
    subject = Graffiti.new
    expect(subject.drawing).to eq default_drawing
  end

  let(:default_drawing) do
    Array.new(15) { Array.new(31) { "" } }
  end
end
