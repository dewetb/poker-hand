require 'pry'

#takes 5 cards & determines the highest poker hand
module PokerHand
  def self.best_hand(cards_string)
    @card_array = cards_string.split(' ').map { |card| Card.new(card) }
    if royal_flush?
      'Royal Flush'
    elsif straight_flush?
      'Straight Flush'
    elsif four_of_a_kind?
      'Four Of A Kind'
    elsif full_house?
      'Full House'
    elsif flush?
      'Flush'
    elsif straight?
      'Straight'
    elsif three_of_a_kind?
      'Three Of A Kind'
    elsif two_pair?
      'Two Pair'
    elsif one_pair?
      'One Pair'
    else
      'High Card'
    end
  end

  def self.grouped_by_values
    @card_array.group_by(&:value)
  end

  def self.one_pair?
    of_a_kind?(2)
  end

  def self.two_pair?
    grouped_by_values.count { |_, array| array.length == 2 } == 2
  end

  def self.three_of_a_kind?
    of_a_kind?(3)
  end

  def self.four_of_a_kind?
    of_a_kind?(4)
  end

  def self.of_a_kind?(n)
    grouped_by_values.any? { |_, array| array.length == n }
  end

  def self.straight?
    values_array.min + 4 == values_array.max
  end

  def self.values_array
    @card_array.map(&:value)
  end

  def self.flush?
    @card_array.group_by(&:suit).size == 1
  end

  def self.full_house?
    three_of_a_kind? && one_pair?
  end

  def self.straight_flush?
    flush? && straight?
  end

  def self.royal_flush?
    flush? && (values_array.reduce(:+) == 60)
  end
end
