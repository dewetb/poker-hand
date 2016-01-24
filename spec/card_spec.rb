require_relative '../card'

describe Card do
  let (:card1) { Card.new('as') }
  let (:card2) { Card.new('3c') }
  let (:card3) { Card.new('10h') }

  it 'has a suit' do
    expect(card1.suit).to eq('s')
    expect(card2.suit).to eq('c')
  end

  it 'has a value' do
    expect(card1.value).to eq(14)
    expect(card2.value).to eq(3)
    expect(card3.value).to eq(10)
  end
end
