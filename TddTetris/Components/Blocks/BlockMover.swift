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
            x: topLeft.x + CGFloat(SpriteKitGameScene.BLOCK_SIZE * 3),
            y: topLeft.y
        )
    }

    func moveToPreviewArea() {
        self.block.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameScene.BLOCK_SIZE * 12),
            y: topLeft.y
        )
    }

    func moveDownOneRow() {
        self.block.position = CGPoint(
            x: self.block.position.x,
            y: self.block.position.y - CGFloat(SpriteKitGameScene.BLOCK_SIZE)
        )
    }
}