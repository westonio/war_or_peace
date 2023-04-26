class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        card = cards[index]
        card.rank
    end

    def high_ranking_cards
        @cards.filter do |card|
            card.rank > 10
        end
    end

    def percent_high_ranking
        percent = (high_ranking_cards.length.to_f / cards.length.to_f) * 100
        # The lines above first calls the value of high_ranking_cards or cards arrays, passes the length method on it to return 2 for HRC or 3 for cards. 
        # Then passes .to_f to change it to a float value 2.0 for HRC or 3.0 for cards.
        percent.ceil(2)
    end

    def remove_card 
        cards.shift
    end

    def add_card(card)
        cards.push(card)
    end
end