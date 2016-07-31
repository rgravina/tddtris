import SpriteKit

class GameScene: SKScene {
    static let BLOCK_SIZE = 20
    static let BOARD_LEADING_PADDING = 22
    static let BOARD_TOP_PADDING = 43

    var blockGenerator: BlockGenerator!
    var blockMover: BlockMover!

    convenience init(size: CGSize,
                     blockGenerator: BlockGenerator
    ) {
        self.init(size: size)
        self.blockGenerator = blockGenerator

        setupBackgroundImages()
        displayNextBlock()
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    private func setupBackgroundImages() {
        let background = SKSpriteNode(imageNamed: "background")
        background.name = "background"
        background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(background)

        let gameBoardTexture = SKTexture(imageNamed: "gameboard")
        let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: CGSizeMake(CGFloat(GameScene.BLOCK_SIZE) * CGFloat(10), CGFloat(GameScene.BLOCK_SIZE) * CGFloat(20))
        )
        gameBoard.name = "gameboard"
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
        gameBoard.position = CGPoint(x: 12, y: frame.height - 12)
        addChild(gameBoard)
    }

    private func displayNextBlock() {
        let block = blockGenerator.nextBlock()
        let mover = BlockMover(
            block: block,
            topLeft: CGPoint(
                x: CGFloat(GameScene.BOARD_LEADING_PADDING),
                y: frame.height - CGFloat(GameScene.BOARD_TOP_PADDING)
            )
        )
        mover.moveToDropCoordinates()
        addChild(block as! SKNode)
    }
}
