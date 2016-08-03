import SpriteKit

class GameScene: SKScene {
    static let BLOCK_SIZE = 36
    static let BOARD_TOP_PADDING = 54

    var blockGenerator: BlockGenerator!
    var blockMover: BlockMover!
    var topLeft: CGPoint!

    convenience init(size: CGSize,
                     blockGenerator: BlockGenerator
    ) {
        self.init(size: size)
        self.blockGenerator = blockGenerator
        self.topLeft = CGPoint(
            x: CGFloat(0),
            y: frame.height - CGFloat(GameScene.BOARD_TOP_PADDING)
        )
        displayNextBlock()
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    private func displayNextBlock() {
        let nextBlock = blockGenerator.nextBlock()
        BlockMover(block: nextBlock, topLeft: topLeft).moveToDropCoordinates()
        addChild(nextBlock as! SKNode)
    }
}
