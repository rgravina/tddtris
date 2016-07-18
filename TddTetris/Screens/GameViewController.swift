import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let viewer: GameView!

    init(viewer: GameView) {
        self.viewer = viewer
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
        viewer.configure(view.frame)
        viewer.presentScene()
    }

    private func addSubviews() {
        view.addSubview(viewer.view)
    }
}
