import UIKit

class GamePlayViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension GamePlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card Cell", for: indexPath)
        cell.layer.cornerRadius = cell.frame.size.width / 6
        cell.clipsToBounds = true
        return cell
    }
}

extension GamePlayViewController: UICollectionViewDelegate {
    
}
