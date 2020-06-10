require 'pry'

RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
SUITS = %w(Hearts Clubs Diamonds Spades).freeze
VALUES = RANKS.zip((2..14).to_a).to_h

# Poker!
# In the previous two exercises, you developed a Card class and a Deck
# class. You are now going to use those classes to create and evaluate
# poker hands. Create a class, PokerHand, that takes 5 cards from a Deck
# of Cards and evaluates those cards as a Poker hand.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

class Card
  include Comparable
  attr_reader :rank, :suit, :relative_value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @relative_value = set_relative_value
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  protected

  def <=>(other_card)
    @relative_value <=> other_card.relative_value
  end

  private

  def set_relative_value
    @relative_value = if @rank.class == Integer
                        @rank
                      else
                        face_card_relative_value
                      end
  end

  def face_card_relative_value
    case @rank
    when 'Jack'
      11
    when 'Queen'
      12
    when 'King'
      13
    when 'Ace'
      14
    end
  end
end

class Deck
  attr_reader :cards


  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle
  end

  def draw
    card = @cards.pop
    if time_to_rebuild_deck?
      @cards = build_deck
    end
    card
  end

  def time_to_rebuild_deck?
    @cards.count == 0
  end
end

class PokerHand
  ROYALS = [10, 'Ace', 'Queen', 'King', 'Jack'].freeze

  class Hand
    attr_reader :cards, :suits, :ranks, :unique_ranks

    def initialize(deck)
      # @cards = deck.cards.pop(5)
      @cards = deck
      sort_cards
      @suits = []
      @ranks = []

      @cards.each do |card|
        @suits << card.suit
        @ranks << card.rank
      end

      @unique_ranks = @ranks.uniq
    end

    def sort_cards
      @cards.sort! do |a, b|
        VALUES[a.rank] <=> VALUES[b.rank]
      end
    end
  end

  def initialize(deck)
    @hand = Hand.new(deck)
  end


  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def all_royals?
    @hand.ranks.all? { |rank| ROYALS.include?(rank) }
  end

  def royal_flush?
    flush? && all_royals?
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    return false if @hand.unique_ranks.size != 2
    [1, 4].include?(@hand.ranks.count(@hand.unique_ranks.first))
  end

  def full_house?
    return false if @hand.unique_ranks.size != 2
    [2, 3].include?(@hand.ranks.count(@hand.unique_ranks.first))
  end

  def flush?
    @hand.suits.uniq.size == 1
  end


  def straight?
    straight = true
    first_value = VALUES[@hand.ranks.first]
    expected_value = first_value
    @hand.ranks.each do |rank|
      if VALUES[rank] != expected_value
        straight = false
        break
      end
      expected_value += 1
    end
    straight
  end

  def three_of_a_kind?
    result = false
    return false if @hand.unique_ranks.size != 3
    @hand.unique_ranks.each do |rank|
      if @hand.ranks.count(rank) == 3
        result = true
        break
      end
    end
    result
  end

  def two_pair?
    return false if @hand.unique_ranks.size != 3
    pairs_count = 0
    @hand.unique_ranks.each do |rank|
      if @hand.ranks.count(rank) == 2
        pairs_count += 1
      end
    end
    pairs_count == 2
  end

  def pair?
    @hand.unique_ranks.size == 4
  end
end
# Testing your class:

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
print 'Three of a kind: '
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
print 'Two pair: '
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'


# Output:

# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
