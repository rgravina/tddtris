import SpriteKit

class BlockMover {
    let block: Block!
    let height: CGFloat!

    init(block: Block, height: CGFloat) {
        self.block = block
        self.height = height
    }

    func moveToDropCoordinates() {
        self.block.position = CGPoint(x: CGFloat(GameScene.BOARD_LEADING_PADDING + GameScene.BLOCK_SIZE * 4), y: height - CGFloat(GameScene.BOARD_TOP_PADDING))
    }
}