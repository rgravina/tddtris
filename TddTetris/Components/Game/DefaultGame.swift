import UIKit

class DefaultGame: Game {
    let viewer: GameView!
    let blockGenerator: BlockGenerator!
    let timeKeeper: TimeKeeper!
    var block: Block!

    init(viewer: GameView,
         blockGenerator: BlockGenerator,
         timeKeeper: TimeKeeper
        ) {
        self.viewer = viewer
        self.blockGenerator = blockGenerator
        self.timeKeeper = timeKeeper
    }

    func configure(frame: CGRect) {
        viewer.configure(self, frame: frame, timeKeeper: timeKeeper)
        viewer.presentScene()
        block = blockGenerator.nextBlock()
        viewer.displayNextBlock(block)
    }

    func tick() {
        viewer.moveBlockDownOneRow(block)
    }
}