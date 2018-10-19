require 'game'

describe Game do
  let(:player_1) {double :player_1}
  let(:player_2) {double :player_2}
  subject { described_class.create(player_1: player_1, player_2: player_2) }

  describe '#attack' do
    it 'should attack player 2' do
      # expect(player_1).to receive(:attack)
      expect(player_2).to receive(:reduce_hp)
      subject.attack(player_2)
    end
  end

  describe '#player_1' do
    it 'should return player_1' do
      expect(subject.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'should return player_2' do
      expect(subject.player_2).to eq player_2
    end
  end

  describe '#switch' do
    it 'player_2 should now be player_1' do
      subject.switch
      expect(subject.player_1).to eq player_2
    end
  end

  describe '#lost?' do
    it 'player_2 loses' do
      allow(player_2).to receive(:hp).and_return(0)
      expect(subject.lost?).to be true
    end
  end

end
