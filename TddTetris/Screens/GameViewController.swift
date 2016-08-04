import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let viewer: GameView!
    let blockGenerator: BlockGenerator!

    init(viewer: GameView, blockGenerator: BlockGenerator) {
        self.viewer = viewer
        self.blockGenerator = blockGenerator
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
        viewer.displayNextBlock(blockGenerator.nextBlock())
    }

    private func configureSubviews() {
        viewer.configure(view.frame)
        viewer.presentScene()
    }

    private func addSubviews() {
        view.addSubview(viewer.view)
    }
}
