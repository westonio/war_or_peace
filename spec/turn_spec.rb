require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn.rb'

RSpec.describe Turn do
# Create test deck
    card1 = Card.new(:diamond,'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart,'Ace',14)
    card4 = Card.new(:club,'Queen', 12)
    card5 = Card.new(:diamond,'1', 1)
    card6 = Card.new(:club,'8', 8)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])

# Create test players
    player1 = Player.new("Michael",deck1)
    player2 = Player.new("McKayla",deck2)
# Tests:
    it "has two players with name and deck" do
        turn = Turn.new(player1, player2)
        expect(player1.name).to eq("Michael")
        expect(player2.name).to eq("McKayla")
        expect(player1.deck).to eq(deck1)
        expect(player2.deck).to eq(deck2)
    end

    it "has a default empty spoils of war array" do
        turn = Turn.new(player1, player2)

        expect(turn.spoils_of_war).to eq([])
    end

    it "has a turn type" do
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:war)
    end
end