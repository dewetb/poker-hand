require_relative '../poker_hand'

describe PokerHand do
  it 'checks for high cards' do
    expect(PokerHand.best_hand('as 6d qh jd 2s')).to eq('High Card')
    expect(PokerHand.best_hand('as 5d qh 2d 9s')).to eq('High Card')
  end

  it 'checks for one pair' do
    expect(PokerHand.best_hand('as 5d qh 2d 2s')).to eq('One Pair')
    expect(PokerHand.best_hand('10s 5d qh 2d 10s')).to eq('One Pair')
  end

  it 'checks for two pair' do
    expect(PokerHand.best_hand('10s 10d qh 2d 2s')).to eq('Two Pair')
  end

  it 'checks for three of a kind' do
    expect(PokerHand.best_hand('10s 10d 10h 3d 2s')).to eq('Three Of A Kind')
  end

  it 'checks for a straight' do
    expect(PokerHand.best_hand('3s 4d 5h 6d 7s')).to eq('Straight')
  end

  it 'checks for a flush' do
    expect(PokerHand.best_hand('3h kh 6h 10h 2h')).to eq('Flush')
  end

  it 'checks for a full house' do
    expect(PokerHand.best_hand('3h 3d 3s 10h 10c')).to eq('Full House')
  end

  it 'checks for four of a kind' do
    expect(PokerHand.best_hand('3h 3d 3s 3c 10c')).to eq('Four Of A Kind')
  end

  it 'checks for straight flush' do
    expect(PokerHand.best_hand('5d 6d 7d 8d 9d')).to eq('Straight Flush')
  end

  it 'checks for a royal flush' do
    expect(PokerHand.best_hand('ah kh qh jh 10h')).to eq('Royal Flush')
  end
end
