import UIKit

class GamePlayViewController: UIViewController {

    private var deckModel: DecksModel!
    var deck: Deck
    
    private var model: GamePlayModel!
    
    var numOfCardsFlipped: Int = 0
    
    required init?(coder: NSCoder) {
        deckModel = DecksModel()
        deck = deckModel.deck
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = GamePlayModel()
        model.delegate = self
        
    }
}

extension GamePlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card Cell", for: indexPath) as! CardCollectionViewCell
        cell.layer.cornerRadius = cell.frame.size.width / 6
        cell.clipsToBounds = true
        cell.frontCardImage.image = UIImage(named: deck.cards[indexPath.row].frontImageName)
        return cell
    }
}

extension GamePlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //If this is the first card flipped.
        if numOfCardsFlipped == 0 {
            let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            cell.flip()
            deck.cards[indexPath.row].isFlipped = true
            numOfCardsFlipped += 1
            model.cardWasFlipped(deck: deck, card: indexPath.row)
            model.previousIndexPath = indexPath
        } else { //This is the second card flipped
            
            let cell1 = collectionView.cellForItem(at: model.previousIndexPath!) as! CardCollectionViewCell
            let cell2 = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            cell2.flip()
            deck.cards[indexPath.row].isFlipped = true
            model.cardWasFlipped(deck: deck, card: indexPath.row)
            if !model.wasCardMatched(deck) && !deck.cards[model.previousIndexPath!.row].isMatched && !deck.cards[indexPath.row].isMatched {
                cell1.flipBack()
                cell2.flipBack()
            } else {
                deck.cards[model.previousIndexPath!.row].isMatched = true
                deck.cards[indexPath.row].isMatched = true
            }
            
            model.checkWin(deck: deck)
            numOfCardsFlipped = 0
        }
        
        
    }
}

extension GamePlayViewController: GamePlayModelDelegate {
    func gameWon() {
        let alert = UIAlertController(title: "You Won!", message: "Congrats", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
