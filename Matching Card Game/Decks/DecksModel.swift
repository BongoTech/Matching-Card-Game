import Foundation

protocol DecksModelDelegate {
    
}

class DecksModel {
    let deck: Deck
    
    init() {
        deck = DecksModel.createDeck()
    }
    
    private static func createDeck() -> Deck {
        var cards = [Card]()
        
        var usedCards = [UInt32]()
        var index = 0
        
        while (index < 36) {
            var random: UInt32
            
            random = arc4random_uniform(18) + 1
            while (usedCards.contains(random)) {
                random = arc4random_uniform(18) + 1
            }
            usedCards.append(random)
            
            let card1 = Card(frontImageName: "card_\(random)")
            let card2 = Card(frontImageName: "card_\(random)")
            print(random)

            cards.append(card1)
            cards.append(card2)
            index += 2
        }
        
        return Deck(name: "Fun Shapes", cards: cards)
    }
}
