import SpriteKit

class GameScene: SKScene {
    var blockGenerator: BlockGenerator!

    convenience init(size: CGSize, blockGenerator: BlockGenerator) {
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
        let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: CGSizeMake(Block.SIZE * CGFloat(10), Block.SIZE * CGFloat(20))
        )
        gameBoard.name = "gameboard"
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
        gameBoard.position = CGPoint(x: 12, y: frame.height - 12)
        addChild(gameBoard)
    }

    private func displayNextBlock() {
        let block = blockGenerator.nextBlock()
        block.position = CGPoint(x: 22 + Block.SIZE * 4, y: frame.height - 43)
        addChild(block)
    }
}
