class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
            :mutually_assured_destruction
        elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
            :war
        else
            :basic
        end
    end

    def winner
        if type == :basic
            if player1.deck.cards[0].rank > player2.deck.cards[0].rank
                player1
            else
                player2
            end
        elsif type == :war
            if player1.deck.cards[2].rank > player2.deck.cards[2].rank
                player1
            else
                player2
            end
        else # :mutually_assured_destruction
            "No Winner"
        end
    end

    def pile_cards
        if type == :basic
            spoils_of_war << player1.deck.cards.shift
            spoils_of_war << player2.deck.cards.shift
        elsif type == :war
            spoils_of_war << player1.deck.cards.shift(3)
            spoils_of_war << player2.deck.cards.shift(3)
            spoils_of_war.flatten!
        else # :mutually_assured_destruction
            player1.deck.cards.shift(3)
            player2.deck.cards.shift(3) 
        end 
    end
end