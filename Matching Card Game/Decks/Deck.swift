import Foundation

struct Deck {
    let name: String
    var cards: [Card]
}

struct Card {
    var frontImageName: String
    var isFlipped: Bool
}
