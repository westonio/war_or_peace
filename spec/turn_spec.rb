require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
# Test Cards
    card1 = Card.new(:diamond,'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart,'Ace',14)
    card4 = Card.new(:club,'king', 13)
    card5 = Card.new(:diamond,'3', 3)
    card6 = Card.new(:club,'Queen', 12)
    
# Basic turn test deck
    b_deck1 = Deck.new([card1,card2,card3])
    b_deck2 = Deck.new([card4,card5,card6])

# War turn test deck
    w_deck1 = Deck.new([card1,card2,card3])
    w_deck2 = Deck.new([card6,card5,card4])

# Mutually assured destruction test deck
    m_deck1 = Deck.new([card2,card3,card6])
    m_deck2 = Deck.new([card5,card4,card1])

# Tests:
    it "has two players with name and deck" do
        player1 = Player.new("Michael",b_deck1)
        player2 = Player.new("McKayla",b_deck2)
        turn = Turn.new(player1, player2)
        expect(player1.name).to eq("Michael")
        expect(player2.name).to eq("McKayla")
        expect(player1.deck).to eq(b_deck1)
        expect(player2.deck).to eq(b_deck2)
    end

    it "has a default empty spoils of war array" do
        player1 = Player.new("Michael",b_deck1)
        player2 = Player.new("McKayla",b_deck2)
        turn = Turn.new(player1, player2)

        expect(turn.spoils_of_war).to eq([])
    end

    it "has a turn type" do
        player1 = Player.new("Michael",b_deck1)
        player2 = Player.new("McKayla",b_deck2)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)

        player3 = Player.new("Michael",w_deck1)
        player4 = Player.new("McKayla",w_deck2)
        turn = Turn.new(player3, player4)
        expect(turn.type).to eq(:war)

        player5 = Player.new("Michael",m_deck1)
        player6 = Player.new("McKayla",m_deck2)
        turn = Turn.new(player5, player6)
        expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it "has a winner or mutual loss" do
        player1 = Player.new("Michael",b_deck1)
        player2 = Player.new("McKayla",b_deck2)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)
        expect(turn.winner).to eq(player2)

        player3 = Player.new("Michael",w_deck1)
        player4 = Player.new("McKayla",w_deck2)
        turn = Turn.new(player3, player4)
        expect(turn.type).to eq(:war)
        expect(turn.winner).to eq(player3)

        player5 = Player.new("Michael",m_deck1)
        player6 = Player.new("McKayla",m_deck2)
        turn = Turn.new(player5, player6)
        expect(turn.type).to eq(:mutually_assured_destruction)
        expect(turn.winner).to eq("No Winner")
    end

    
    it "adds cards to spoils_of_war or discards based off type" do
        player1 = Player.new("Michael",b_deck1)
        player2 = Player.new("McKayla",b_deck2)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1,card4])
        expect(player1.deck.cards).to eq([card2,card3])

        player3 = Player.new("Michael",w_deck1)
        player4 = Player.new("McKayla",w_deck2)
        turn = Turn.new(player3, player4)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1,card2,card3,card6,card5,card4])

        player5 = Player.new("Michael",m_deck1)
        player6 = Player.new("McKayla",m_deck2)
        turn = Turn.new(player5, player6)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([])
    end


    it "awards spoils to the end of winner's deck" do
        deck1 = Deck.new([card1,card2,card3])
        deck2 = Deck.new([card4,card5,card6])
        player1 = Player.new("Michelle",deck1)
        player2 = Player.new("Marissa",deck2)
        turn = Turn.new(player1, player2)
    
        expect(turn.winner).to eq(player2)
        
        turn.pile_cards
        winner = turn.winner
        turn.award_spoils(winner)
        expect(winner.deck.cards).to eq([card5,card6,card1,card4])
    end

end