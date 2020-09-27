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
        
        var usedCardsOnce = [UInt32]()
        var usedCardsTwice = [UInt32]()
        var index = 0
        
        while (index < 36) {
            var random: UInt32
            
            random = arc4random_uniform(18) + 1
            
            if usedCardsTwice.contains(random) {
                while usedCardsTwice.contains(random) {
                    random = arc4random_uniform(18) + 1
                }
                if usedCardsOnce.contains(random) {
                    usedCardsTwice.append(random)
                } else {
                    usedCardsOnce.append(random)
                }
            } else if usedCardsOnce.contains(random) {
                usedCardsTwice.append(random)
            } else {
                usedCardsOnce.append(random)
            }
            
            let card1 = Card(frontImageName: "card_\(random)", isFlipped: false, isMatched: false)
            //let card2 = Card(frontImageName: "card_\(random)", isFlipped: false, isMatched: false)
            //print(random)

            cards.append(card1)
            //cards.append(card2)
            index += 1
        }
        
        print(usedCardsTwice)
        print(usedCardsOnce)
        
        return Deck(name: "Fun Shapes", cards: cards)
    }
}
