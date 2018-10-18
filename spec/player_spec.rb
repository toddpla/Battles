require 'player'

describe Player do
  describe "#initialise" do
    subject { described_class.new(name: "Imtiyaz") }
    it "should have a name Imtiyaz" do
      expect(subject.name).to eq "Imtiyaz"
    end
    it "should have a hp of 100" do
      expect(subject.hp).to eq 100
    end
  end
end
