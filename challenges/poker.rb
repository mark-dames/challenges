class Hand
  include Comparable
  attr_accessor :cards, :ranks, :suits
  
  RANK_VALUES = {
    'T' => 10,
    'J' => 11, 
    'Q' => 12, 
    'K' => 13,
    'A' => 14
  }
  
  def initialize(cards)
    @cards = cards
    @ranks = get_ranks(cards)
    @suits = get_suits(cards)
  end
  
  def get_ranks(cards)
    cards.map { |card| card[0] }.map do |rank|
      if rank.match(/[0-9]/)
        rank.to_i
      else
        RANK_VALUES[rank]
      end
    end.sort
  end
  
  def get_suits(cards)
    cards.map { |card| card[1] }
  end
  
  def sequential?
    result = ranks[0...-1].each.with_index.all? do |rank, idx|
      ranks[idx+1] - ranks[idx] == 1
    end
    
    if ranks.last == 14 
      ranks[0..3] == [2,3,4,5]
    else
      result
    end
  end
  
  def categorie
    if straight_flush?
      1
    elsif four_of_a_kind?
      2
    elsif full_house?
      3
    elsif flush?
      4
    elsif straight?
      5
    elsif three_of_a_kind?
      6
    elsif two_pair?
      7
    elsif one_pair?
      8
    elsif high_card?
      9
    end
  end
  
  def <=>(other_hand)
    rank1 = categorie
    rank2 = other_hand.categorie
    result = rank1 <=> rank2
    case result
    when -1 then [cards]
    when 1 then [other_hand.cards]
    else 
      ranks.reduce(&:+) > other_hand.ranks.reduce(&:+) ? [cards] : [other_hand.cards]
    end
  end
  
  def straight_flush?
    suits.uniq.size == 1 && sequential?
  end
  
  def four_of_a_kind?
    unique = ranks.uniq
    unique.size == 2 && unique.any? { |rank| ranks.count(rank) == 4 }
  end
  
  def full_house?
    unique = ranks.uniq
    unique.size == 2 && 
    unique.map { |rank| ranks.count(rank) }.sort == [2, 3]
  end
  
  def flush?
    suits.uniq.size == 1 && !sequential?
  end
  
  def straight?
    sequential? && suits.uniq.size != 1
  end
  
  def three_of_a_kind?
    unique = ranks.uniq
    unique.size == 3 && 
    unique.map { |rank| ranks.count(rank) }.sort == [1, 1, 3]
  end
  
  def two_pair?
    unique = ranks.uniq
    unique.size == 3 && 
    unique.map { |rank| ranks.count(rank) }.sort == [1, 2, 2]
  end
  
  def one_pair?
    unique = ranks.uniq
    unique.size == 4 && 
    unique.map { |rank| ranks.count(rank) }.sort == [1, 1, 1, 2]
  end
  
  def high_card?
    ranks.uniq.size != 1 && !sequential? && suits.uniq.size != 1
  end
end

class Poker
  def initialize(cards)
    @hand1 = Hand.new(cards[0])
    @hand2 = Hand.new(cards[1]) unless cards.size == 1
  end
  
  def best_hand
    return [@hand1.cards] if @hand2.nil?
    @hand1.<=>(@hand2)
  end
end


