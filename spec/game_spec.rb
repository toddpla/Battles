require 'game'

describe Game do
  let(:player_1) {double :player_1}
  let(:player_2) {double :player_2}
  subject { described_class.new(player_1: player_1, player_2: player_2) }

  describe '#attack' do
    it 'should attack player 2' do
      # expect(player_1).to receive(:attack)
      expect(player_2).to receive(:reduce_hp)
      subject.attack(player_2)
    end
  end

end
