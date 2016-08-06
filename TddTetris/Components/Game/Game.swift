import UIKit

class Game {
    let viewer: GameView!
    let blockGenerator: BlockGenerator!

    init(viewer: GameView, blockGenerator: BlockGenerator) {
        self.viewer = viewer
        self.blockGenerator = blockGenerator
    }

    func configure(frame: CGRect) {
        viewer.configure(frame)
        viewer.presentScene()
        viewer.displayNextBlock(blockGenerator.nextBlock())
    }
}