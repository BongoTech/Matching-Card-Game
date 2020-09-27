import UIKit

class GamePlayViewController: UIViewController {

    var deckModel: DecksModel
    var deck: Deck
    

    required init?(coder: NSCoder) {
        deckModel = DecksModel()
        deck = deckModel.deck
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    
}
