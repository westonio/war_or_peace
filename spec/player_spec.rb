require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do

  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart,'Ace',14)
  cards = [card1,card2,card3]
  deck = Deck.new(cards)

    it "has a name" do
        player = Player.new("Michael", deck)
        expect(player.name).to eq("Michael")
    end

    it "initialized with a deck" do
        player = Player.new("Michael", deck)
        expect(player.deck).to eq(deck)
    end

    it "loses once no cards are left" do
        player = Player.new("Michael", deck)

        expect(player.has_lost?).to eq false
        player.deck.remove_card
        expect(player.has_lost?).to eq false

        player.deck.remove_card
        player.deck.remove_card
        expect(player.has_lost?).to eq true
    end
end