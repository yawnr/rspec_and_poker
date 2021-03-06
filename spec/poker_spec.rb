require 'poker'

describe Card do

  describe '#initialize' do
    it "creates a card with a suit and a value" do
      expect(Card.new(:hearts, 8).value).to eq (8)
    end
  end
end

describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do

    it "creates a 52 card deck" do
      expect(deck.cards.length).to eq(52)
    end
    it "has 13 cards of each suit" do
      hearts = deck.cards.select { |card| card.suit == :hearts }
      expect(hearts.length).to eq(13)
    end
    it "has four cards of each value" do
      queens = deck.cards.select { |card| card.value == 12 }
      expect(queens.length).to eq(4)
    end
  end

  describe '#remove' do
    it "takes a card and removes it from the deck" do
      eight_of_hearts = (deck.cards.select {|card| card.value == 8 && card.suit == :hearts }).first
      deck.remove(eight_of_hearts)
      expect(deck.cards.include?(eight_of_hearts)).to be_falsey
      expect(deck.cards.length).to eq(51)
    end
  end
end

describe Hand do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new(deck) }

  describe '#initialize' do
    it "has a reference to the deck" do
      expect(hand.deck.cards).to be_a(Array)
    end
    it "begins with an empty hand" do
      expect(hand.cards_in_hand).to eq([])
    end
  end

  describe '#get_cards'do
    it "adds the drawn cards to the hand" do
      hand.get_cards(3)
      expect(hand.cards_in_hand.size).to eq(3)
    end
  end

  describe '#put_cards' do
    it "takes cards from the hand" do
      hand.get_cards(3)
      hand.put_cards(1)
      expect(hand.cards_in_hand.length).to eq(2)
    end
    it "places the discarded cards in the deck" do
      hand.get_cards(3)
      hand.put_cards(1)
      expect(hand.deck.cards.length).to eq(50)
    end

  end

  describe '#what_hand' do
    it "should recognize a straight flush" do
      hand.cards_in_hand = [Card.new(:hearts,13),
                            Card.new(:hearts,12),
                            Card.new(:hearts,11),
                            Card.new(:hearts,10),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:straight_flush)
    end
    it "should recognize a four-of-a-kind" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,13),
                            Card.new(:clubs,13),
                            Card.new(:diamonds,13),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:four_kind)
    end
    it "should recognize a full house" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,13),
                            Card.new(:clubs,13),
                            Card.new(:diamonds,9),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:full_house)
    end
    it "should recognize a flush" do
      hand.cards_in_hand = [Card.new(:hearts,13),
                            Card.new(:hearts,8),
                            Card.new(:hearts,4),
                            Card.new(:hearts,10),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:flush)
    end
    it "should recognize a straight" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,12),
                            Card.new(:clubs,11),
                            Card.new(:diamonds,10),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:straight)
    end
    it "should recognize a three-of-a-kind" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,13),
                            Card.new(:clubs,13),
                            Card.new(:diamonds,4),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:three_kind)
    end
    it "should recognize two-pair" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,13),
                            Card.new(:clubs,11),
                            Card.new(:diamonds,11),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:two_pair)
    end
    it "should recognize a pair" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,13),
                            Card.new(:clubs,4),
                            Card.new(:diamonds,6),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:pair)
    end
    it "should recognize high card" do
      hand.cards_in_hand = [Card.new(:spades,13),
                            Card.new(:hearts,8),
                            Card.new(:clubs,6),
                            Card.new(:diamonds,2),
                            Card.new(:hearts,9)]
      expect(hand.what_hand).to eq(:high_card)
    end
    # it "should make sure there are five cards in the hand" do
    #   hand.cards_in_hand = [Card.new(:spades,13),
    #                         Card.new(:hearts,13),
    #                         Card.new(:clubs,13),
    #                         Card.new(:diamonds,13)]
    #   expect(hand.what_hand).to raise(:four_kind)
    # end

  end
end
