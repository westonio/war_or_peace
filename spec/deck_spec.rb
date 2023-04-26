require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    
  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart,'Ace',14)
  cards = [card1,card2,card3]

    it "exists" do
        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end
    
    it "has a cards array" do
        deck = Deck.new(cards)

        expect(deck.cards).to eq([card1,card2,card3])
    end

    it "returns rank of a card at given index" do
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to be 12
        expect(deck.rank_of_card_at(1)).to be 3
        expect(deck.rank_of_card_at(2)).to be 14
    end

    it "returns array of cards with rank 11 or above" do
        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card1,card3])
    end

    it "returns the percentage of high ranking cards" do
        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to be 66.67
    end 

    it "remove the top (beginning) card from deck" do
        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
    end

    it "adds a new card to the end of the deck" do
        deck = Deck.new(cards)

        expect(deck.add_card(card1)).to eq([card2,card3,card1])
    end
end