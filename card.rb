# a normal playing card
class Card
  attr_reader :suit, :value
  def initialize(card_string)
    @suit = card_string[-1]
    @value = value_to_number(card_string.chop)
  end

  def value_to_number(value)
    return value.to_i if value.to_i != 0
    { 'j' => 11, 'q' => 12, 'k' => 13, 'a' => 14 }[value]
  end
end
