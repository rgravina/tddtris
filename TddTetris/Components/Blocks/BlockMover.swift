import SpriteKit

class BlockMover {
    var block: Block!
    let topLeft: CGPoint!

    init(block: Block, topLeft: CGPoint) {
        self.block = block
        self.topLeft = topLeft
    }

    func moveToDropCoordinates() {
        self.block.position = CGPoint(
            x: topLeft.x + CGFloat(GameScene.BLOCK_SIZE * 4),
            y: topLeft.y
        )
    }
}