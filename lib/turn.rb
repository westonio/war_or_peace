class Turn
    attr_reader :player1, :player2, :spoils_of_war, :type

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = determine_type
    end

    def determine_type
        p1_card = player1.deck.cards
        p2_card = player2.deck.cards
        
        if p1_card[0].rank == p2_card[0].rank && p1_card[2].rank == p2_card[2].rank
            type = :mutually_assured_destruction
        elsif p1_card[0].rank == p2_card[0].rank
            type = :war
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
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times do 
                spoils_of_war << player1.deck.remove_card
            end
            3.times do
                spoils_of_war << player2.deck.remove_card
            end
        else # :mutually_assured_destruction
            3.times do player1.deck.remove_card end
            3.times do player2.deck.remove_card end
        end 
    end

    def award_spoils(winner)
        until @spoils_of_war == []
            winner.deck.add_card(spoils_of_war.shift)
        end
    end 
end