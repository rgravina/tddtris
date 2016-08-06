import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let game: Game!

    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        addSubviews()
    }

    private func configureSubviews() {
        game.configure(view.frame)
    }

    private func addSubviews() {
        view.addSubview(game.viewer.view)
    }
}
