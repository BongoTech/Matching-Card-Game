import Foundation

protocol GamePlayModelDelegate: class {
    func gameWon()
}
class GamePlayModel {
    
    weak var delegate: GamePlayModelDelegate?
    
    var numberFlipped: Int = 0
    var previousIndexPath: IndexPath?
    var cardsFlipped: [Int] = [-1, -1]

    func checkWin(deck: Deck) {
        for card in deck.cards {
            if !card.isMatched {
                return
            }
        }
        delegate?.gameWon()
    }
    
    func cardWasFlipped(deck: Deck, card: Int) {
        if numberFlipped == 0 {
            cardsFlipped[numberFlipped] = card
            numberFlipped += 1
        } else if numberFlipped == 1 {
            cardsFlipped[numberFlipped] = card
            numberFlipped = 0
        }
    }
    
    func wasCardMatched(_ deck: Deck) -> Bool {
        //sleep(1)
        if deck.cards[cardsFlipped[0]].frontImageName == deck.cards[cardsFlipped[1]].frontImageName {
            return true
        } else {
            return false
        }
    }
    
}
