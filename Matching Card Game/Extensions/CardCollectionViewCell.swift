import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var frontCardImage: UIImageView!
    
    @IBOutlet weak var backCardImage: UIImageView!
    
    func flip() {
        UIView.transition(from: backCardImage, to: frontCardImage, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            UIView.transition(from: self.frontCardImage, to: self.backCardImage, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
        

    }
}
