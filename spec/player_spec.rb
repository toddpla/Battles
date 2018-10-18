require 'player'

describe Player do
  subject { described_class.new(name: "Imtiyaz") }
  
  describe "#initialise" do
    it "should have a name Imtiyaz" do
      expect(subject.name).to eq "Imtiyaz"
    end
    it "should have a hp of 100" do
      expect(subject.hp).to eq 100
    end
  end

  describe "#reduce_hp" do
    it "should reduce hp by 10" do
      expect { subject.reduce_hp }.to change { subject.hp }.by(-10)
    end
  end
end
