require 'pry'
# Poker!
# In the previous two exercises, you developed a Card class and a Deck
# class. You are now going to use those classes to create and evaluate
# poker hands. Create a class, PokerHand, that takes 5 cards from a Deck
# of Cards and evaluates those cards as a Poker hand.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

class Card
  VALUES = Deck::RANKS.zip((2..14).to_a).to_h
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

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

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

