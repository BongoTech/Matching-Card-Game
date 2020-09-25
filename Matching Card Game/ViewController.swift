import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        presentGamePlayViewController()
    }

    func presentGamePlayViewController() {
        let gamePlayStoryboard = UIStoryboard(name: "GamePlay", bundle: nil)
        guard let gamePlayController = gamePlayStoryboard.instantiateInitialViewController() as? GamePlayViewController else {
            return
        }
        
        gamePlayController.willMove(toParent: self)
        addChild(gamePlayController)
        view.addSubview(gamePlayController.view)
        gamePlayController.view.pinFullScreen(to: view)
        gamePlayController.didMove(toParent: self)
    }

}

